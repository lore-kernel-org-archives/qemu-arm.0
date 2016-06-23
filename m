Received: by 10.25.21.96 with SMTP id l93csp674809lfi;
        Thu, 23 Jun 2016 12:06:45 -0700 (PDT)
X-Received: by 10.200.44.78 with SMTP id e14mr99143qta.77.1466708805571;
        Thu, 23 Jun 2016 12:06:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 61si1566099qtb.35.2016.06.23.12.06.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 12:06:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38831 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG9xd-00081Y-3p
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 15:06:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bG9xa-00081F-QS
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 15:06:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bG9xX-0000bB-Gn
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 15:06:42 -0400
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231]:34671)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bG9xX-0000b2-Bx; Thu, 23 Jun 2016 15:06:39 -0400
Received: by mail-qk0-x231.google.com with SMTP id t127so119066342qkf.1;
	Thu, 23 Jun 2016 12:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=xYPcWYeoXEVzQzpp/Mrv8DHHj4CLmwHp0lYDjr3wx8Q=;
	b=PwWTnJdLvLYKzS9wKh/oA6paxr1wppn1R3h/eE/qP1717xEeo1kD3H5kEYMB+WbBXo
	o/fAhdKLk3wdhWy4xSXtGw0HjdbOBB8QEsrf5laVGrQmw1csviGNX61nJUsR7IsoTNQK
	tOgirf1DTf29zAMA8YOWVFa1Zk8L4tpy0CfB/xKSXezqcJouOGxPta2s5CbqnuW+zSI/
	CamMViDcmC1ny5rFp7dlJDWBEEpLENB11KF5bpLOh4vlgdPsPJX3BZEBa4F2292cD60L
	UFrVuY/CwuGSZmxMyWeyCdCEqoda/9F+7jfeEAX/uSCrAgIBFQb3e4Z6iWng42C0sM5P
	vPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=xYPcWYeoXEVzQzpp/Mrv8DHHj4CLmwHp0lYDjr3wx8Q=;
	b=YCyGHMx/xtOfhaNZ9cTWdR4poSqzVpEO03NuCQ17VYNsLCR3xrgvBA2wNB12Ci1vnL
	3E4K2V2hIO4dDEDEQ/EttkW1yLj6PC/ii7JjHtN2V0uoX5dJsIpJptjGE8PxxaWRFICP
	UuMyVoDtAXRwJoF3bNWet+69pDdsGjgKLz04b9DT/L7MYW7ytToGOvQVjowwP2k78sIz
	B6KtvELtTU3zOb3O8Jyfq2VB2vYemGvMBRz9LN4GU4QAt2PszOhDAZDejZDpibUQy1ur
	Q4wOswymUBOnCvoBmW9adKqyfuSaGlw5yRalLvo8H4+KW/Vfi5YCZeMUKnFnmAwYSNI+
	ktsQ==
X-Gm-Message-State: ALyK8tIBF44pqV1FKqOXtnVj6a7KCvNxuyUy7z+HOE4509WCpvLvn6bMHJ+oxi51K2OzZQ==
X-Received: by 10.237.50.199 with SMTP id z65mr174571qtd.24.1466708798982;
	Thu, 23 Jun 2016 12:06:38 -0700 (PDT)
Received: from bigtime.twiddle.net (71-37-54-227.tukw.qwest.net.
	[71.37.54.227]) by smtp.googlemail.com with ESMTPSA id
	t1sm600242qke.18.2016.06.23.12.06.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jun 2016 12:06:37 -0700 (PDT)
To: Sergey Sorokin <afarallax@yandex.ru>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1466599029-3388432-1-git-send-email-afarallax@yandex.ru>
	<5d86b8ba-16e8-e94d-ba7f-e865cbcc938e@twiddle.net>
	<1793281466613020@web5h.yandex.ru>
	<6c24c820-4a26-848c-e62d-88ebce59125d@twiddle.net>
	<201241466676212@web21j.yandex.ru>
	<458f40bb-cb58-4e10-2237-a08cb35155bd@twiddle.net>
	<200981466691221@web14m.yandex.ru>
	<d021833e-312d-5dad-1a77-5800fadb733a@twiddle.net>
	<804691466706062@web16g.yandex.ru>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <a58d7cf7-b586-bf4e-1336-b31dc58d4580@twiddle.net>
Date: Thu, 23 Jun 2016 12:06:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <804691466706062@web16g.yandex.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::231
Subject: Re: [Qemu-arm] [PATCH v2] Improve the alignment check infrastructure
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
Cc: Claudio Fontana <claudio.fontana@huawei.com>,
	Alexander Graf <agraf@suse.de>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Vassili Karpov <av1474@comtv.ru>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sTVpmJdROTln

On 06/23/2016 11:21 AM, Sergey Sorokin wrote:
> Yes, I thought about it. tcg_canonicalize_memop() is good place too.
> But do you think that get_alignment_bits() is not good enough?

I think the earlier a target-* translator problem is diagnosed the better.

Leaving things in get_alignment_bits is ok, so long as we then invoke 
get_alignment bits in tcg_canonicalize_memop.  Perhaps

static inline TCGMemOp tcg_canonicalize_memop(TCGMemOp op, bool is64, bool st)
{
     /* Trigger the asserts within sooner rather than later.  */
     (void)get_alignment_bits(op);
     ...
}



r~
