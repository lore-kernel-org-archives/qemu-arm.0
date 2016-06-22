Received: by 10.25.21.96 with SMTP id l93csp2320251lfi;
        Wed, 22 Jun 2016 00:07:24 -0700 (PDT)
X-Received: by 10.200.41.163 with SMTP id 32mr36006475qts.101.1466579244376;
        Wed, 22 Jun 2016 00:07:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a45si48976179qta.99.2016.06.22.00.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 00:07:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFcFv-0001qb-Kj
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 03:07:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bFcFr-0001oe-VQ
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 03:07:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bFcFl-00036k-F8
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 03:07:18 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34985)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bFcFl-00036f-Ah; Wed, 22 Jun 2016 03:07:13 -0400
Received: by mail-qk0-x244.google.com with SMTP id b136so8093368qkg.2;
	Wed, 22 Jun 2016 00:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=cq1padYThqBErYL4DFkH4+7FXo05AEiNI9+fpNG+93c=;
	b=Vi/eeoM8VoMljHpZp8y04kTYbOFE5zvH0gBAvVHE9Ba7hwq+mkQ3Eo1XEksgi428UC
	bCP4QHxvD/EeIkL0fMML5SRR1kXtg1hbEZjMuW8t/+thYmGX5uYEmWem0EfIzfgZWrGm
	dWoQt6JytLEILLsc7PtyOKu8Evs2EBoSlpLF3BbmOR2zikwedag0LTEXAqztzH/A27/Y
	WW90akce7hwBYrjlWgpaN3Y+4csMTddSal9sk4WdUpb6DymcgUHksIXvdvuRFQm2CCX4
	Qrtnz/QHhmb8aetGfY2iiCTKFSVzsvgExXgfqSvpITkeJOYSncm0KRgGgKB5T9t7ykUr
	NbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=cq1padYThqBErYL4DFkH4+7FXo05AEiNI9+fpNG+93c=;
	b=OokUFMrPtk/6uQBDiqv8j2bsU6XIYfKQGOPjoBHzIqs9k3AM28hFaJJngriEvj6a3B
	HcUp7ycVZweycDxYXeoo7gI+kLqa64Okl2EbCl1uZdrT++l2F2Ii+bEhQbx0j0dQ8s/F
	VUY8iWWUN4EY8UgJEemJ4MBZU2h4aS6aMKl1+z3Yzj/qByJBOuXxZkm/ueqq2VMNBW8g
	MKwJcpqUb46RKw4SGcO8Jfc2NxgP1/R6gShHzK4wtgNGhp9m1zcrgZI96cHLXcY6ZV0u
	hzB+c7u0ji9L3/8NkuK0gu/cOFNAjrynLKM5d44tK00YwgZtV1+cdt/TyTbLcSl8uK2j
	l2dw==
X-Gm-Message-State: ALyK8tK+o8m64pG2SM9LCeYCOhQh5IF2IM98Rtaj5dBHdlT6bz4MkO/Itnf0sH6csX7xYA==
X-Received: by 10.233.220.132 with SMTP id q126mr34616197qkf.53.1466579232966; 
	Wed, 22 Jun 2016 00:07:12 -0700 (PDT)
Received: from bigtime.twiddle.net (71-37-54-227.tukw.qwest.net.
	[71.37.54.227]) by smtp.googlemail.com with ESMTPSA id
	k54sm6105859qtk.44.2016.06.22.00.07.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2016 00:07:12 -0700 (PDT)
To: Vijay Kilari <vijay.kilari@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
	<1466528974-12183-3-git-send-email-peter.maydell@linaro.org>
	<BY1PR0701MB169163D3032F7EF4FB8FD000F22C0@BY1PR0701MB1691.namprd07.prod.outlook.com>
	<CALicx6vv9K6wYAO-CSi5YOBUQQRSCV-P0DhqSxfT342APZNnfQ@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <2fc3f7e3-fbd2-78cf-e9f7-bdeb7caa08ec@twiddle.net>
Date: Wed, 22 Jun 2016 00:07:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CALicx6vv9K6wYAO-CSi5YOBUQQRSCV-P0DhqSxfT342APZNnfQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] Fw: [PATCH v2 2/6] exec.c: Remove
 static allocation of sub_section of sub_page
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, "Kumar,
	Vijaya" <Vijaya.Kumar@cavium.com>,
	QEMU Developers <qemu-devel@nongnu.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EtabigAIZbFL

On 06/21/2016 11:55 PM, Vijay Kilari wrote:
>> > +    uint16_t sub_section[];
>    NIT: Comment that this variable should be last member of this
> struct will be helpful.
>

No comment required.  The compiler will error otherwise.


r~
