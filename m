Received: by 10.28.91.67 with SMTP id p64csp812071wmb;
        Fri, 9 Mar 2018 05:49:48 -0800 (PST)
X-Google-Smtp-Source: AG47ELt0KXqa67S822cJrN/slSA6goy7UrXeK32Z010B0qCy+SKyepw/2Woscl522pKmkwKdExco
X-Received: by 10.13.203.9 with SMTP id n9mr19244426ywd.135.1520603388554;
        Fri, 09 Mar 2018 05:49:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520603388; cv=none;
        d=google.com; s=arc-20160816;
        b=NyQhBQXkIkpn/vAj3mcAh+7pkBdEm5bNZVCLxPSiibAwXbtrBYvsVN4nLDcVjfhV48
         xQCNXS0le6SBL+PXbXs23CyzII6sjeg6eERymiCrSUtV24M638/6VWwCnJfA1w5u70vP
         VlG164DOpfoxe8ZJsnK/mvM7+NfkPOxSWw9Lfh7fCH2aYJzTdhRWnBmcU+lyZnkhKucC
         HI8mPMrdW48qfafEDfmUGlxxP0MZB3YYpG139CMsIaYfbdA3JOYYrz2DwnmuZpGqmEEW
         Bnmf9CLQ/z89Xk+q3bnalBvNqKNipdtqugFJNCuSVHlXZct7Y6arV3heoUlSs6SNP4eW
         2LWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=kkIg4mrOkt10zSzTtQY62JB8IKfDH0zwcdaJ8DcHwB0=;
        b=rYK9D+AwXm5TASG3O7hJO36JR3/7BEvjcvVc8WXGAsirGYpM4UZW6Rr3TFNxLUBgNT
         Eic/Xsm37A5+TNt0DHocpQFpFM2rW6wNPMtjas1KOm8lCFX5ChgvN/9v8daYGSl/5eVN
         cSSmFPKQhJfL4Zv3EEz0kKdNliQpg7+l75xdBBdNsHswteu4q+HZuZR+1tAzZZzinx7v
         /Ex+JOaicoNS/BecKfFv8z6zNrcICpzIJhziTOShBHEFOhkr8eXQAIq7Nx6vyY38kSzl
         3miaOxcui+Ds9Sv8Do7dPVrXPv62UsCYqYXXh7WW/tjgImfUiDQ4W6ruOjM9wpeSTtDh
         cRGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w5si174399ywl.303.2018.03.09.05.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Mar 2018 05:49:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1euIP6-0001hs-0j
	for alex.bennee@linaro.org; Fri, 09 Mar 2018 08:49:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1euIOt-0001gc-5a
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 08:49:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1euIOq-0005uO-41
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 08:49:35 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38646 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1euIOp-0005u1-Vz; Fri, 09 Mar 2018 08:49:32 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7CF56419DFA4;
	Fri,  9 Mar 2018 13:49:27 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B353E10B0F24;
	Fri,  9 Mar 2018 13:49:14 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-5-git-send-email-eric.auger@redhat.com>
	<CAFEAcA871Ju5cV8EYiXEg65Rofh=Pn2=2h8wy4-QXj-wUzoj+g@mail.gmail.com>
	<d8fbbd0d-3e15-92b2-9e26-fb0103abe65f@redhat.com>
	<CAFEAcA-XzeLWfb5tjHYF=3LQbeMge2yaEYRPqeMLn72u0xJ+kg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ee49a2ff-3f2c-4276-50d6-1b258d0a8a60@redhat.com>
Date: Fri, 9 Mar 2018 14:49:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-XzeLWfb5tjHYF=3LQbeMge2yaEYRPqeMLn72u0xJ+kg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 09 Mar 2018 13:49:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 09 Mar 2018 13:49:27 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v9 04/14] hw/arm/smmuv3: Skeleton
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ySF/KTIyJc/I

Hi Peter,

On 09/03/18 14:37, Peter Maydell wrote:
> On 9 March 2018 at 13:19, Auger Eric <eric.auger@redhat.com> wrote:
>> On 08/03/18 15:27, Peter Maydell wrote:
>>> Consider specifically catching 8-byte accesses to non-64-bit registers?
>>> This is CONSTRAINED UNPREDICTABLE (see spec section 6.2), and "one
>>> of the registers is read/written and other half is RAZ/WI" is permitted
>>> behaviour, but it does mean you need to be a little careful about not
>>> letting the top 32 bits of val become non-zero for the 32-bit register
>>> codepaths. Logging bad 64-bit accesses as LOG_GUEST_ERROR and making
>>> them RAZ/WI might be nicer for guest software developers.
>>
>> I moved to ops with attrs and if a 64-bit access is attempted on
>> something not a 64b reg base, I return an error + log a guest error.
> 
> Ah, you probably don't want to return MEMTX_ERROR, because that
> becomes a guest CPU external-abort exception. An abort is listed
> as one of the permitted constrained-unpredictable behaviours for
> bad 64-bit accesses, but there is a note that "strongly recommends"
> not to abort for cases where the registers might be used by software
> associated with lower exception levels. Rather than trying to decide
> which registers do or don't get to return MEMTX_ERROR, it's probably
> easier just to RAZ/WI and return MEMTX_OK.
> 
> (We had to fix a bug like this in the gicv3 in commits f1945632b43e3
> and 0cf09852015e when we started making MEMTX_ERROR generate aborts,
> though in that case the spec is more definite that abort is not a
> permitted behaviour.)

Yes saw those modifs in gic. I will check & fix this.

Thanks

Eric
> 
> thanks
> -- PMM
> 
