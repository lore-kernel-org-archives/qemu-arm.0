Received: by 10.223.172.38 with SMTP id v35csp7425060wrc;
        Tue, 12 Sep 2017 10:46:08 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QC3yDGqUGZWpffZC4f0nomW/bzG8+9+N4bEkE021rFEOXU631DjlexE3R4E+d5ulapbaktd
X-Received: by 10.200.52.117 with SMTP id v50mr23801330qtb.333.1505238367958;
        Tue, 12 Sep 2017 10:46:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505238367; cv=none;
        d=google.com; s=arc-20160816;
        b=Wys948q1+UzVQv06TEnX9Eerf5AtZhFprnQV4zl9imFhmHOrmq7x6T4Rdc63DRPM9L
         JIpB9JSRuzS+aIKTWYB441hKCA8Aj6mAg1zvs1jafgl34Aj8Os7UvRIp/qwHpEKKOcUd
         w4CH5pud1schi0K/t7JD7zN63RICWeoycBwo5ajmqR8cr1iopASBD6dPUM+1JGg2faSC
         a06v3KQkBF47fZac0WEDx/0utNOmPLD/z3SuNqMlI5IVsoXzzG+vUJ/xYzw0P+1hG/xv
         cEjOSZBritcNvVQkuWVYj+frbiroUKCSi4B3GTqwmIdyD+S67R5Ec2s5RSYOypXskSBU
         feDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=dflh5RUL0T/aSLNM24cwPs17x0CSxRTBn6LD7E8rE0A=;
        b=czKSLdl4w4o3hsfB2f6mhJRM36u+72mUe/MY8zUxxgVWqw3ThHGALE3iIZtW1BnOSz
         moD69Pxzfz43xC95ZBLMx5VL6zrv1/fkIPgaEdWLVs8LD8SGnF4Hm0hsnvZnugqQzUhy
         +HjPUtlUCHGJJfPHjorgYO8RDbAokIlDXXQwv7IMAQc32XzAR4njKYhPkgcqIBcCgYBz
         ZUb5sULfdzEhhh6GPdMt5cMOXNzsXBmTtr5aF/d3vxPbl7F0o8n5TEed9FHSl3Tuwti4
         9ZULyuxPP6biZnCWuGCds0UqUepSw8MQUaBlyT9N1uhwgfMTKl5H5eWCGBYB0efUphbm
         AyUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 66si5261820qte.323.2017.09.12.10.46.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 10:46:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37849 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drpG9-0006mY-M3
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 13:46:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1drpG1-0006mC-9L
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 13:45:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1drpFx-0001Y7-DD
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 13:45:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36676)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1drpFx-0001Xl-7A; Tue, 12 Sep 2017 13:45:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2C857E422;
	Tue, 12 Sep 2017 17:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E2C857E422
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-15.gru2.redhat.com [10.97.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2AD2777BE3;
	Tue, 12 Sep 2017 17:45:48 +0000 (UTC)
Date: Tue, 12 Sep 2017 14:45:47 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20170912174547.GC7570@localhost.localdomain>
References: <20170911110623.24981-1-marcandre.lureau@redhat.com>
	<20170911110623.24981-51-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20170911110623.24981-51-marcandre.lureau@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 12 Sep 2017 17:45:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 50/50] qapi: make query-cpu-definitions
 depend on specific targets
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
Cc: Peter Maydell <peter.maydell@linaro.org>, armbru@redhat.com,
	qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alexander Graf <agraf@suse.de>, "open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pOUyqdtpWZbO

On Mon, Sep 11, 2017 at 01:06:23PM +0200, Marc-Andr=E9 Lureau wrote:
> It depends on TARGET_PPC || TARGET_ARM || TARGET_I386 || TARGET_S390X.
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

--=20
Eduardo
