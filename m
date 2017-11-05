Received: by 10.223.150.237 with SMTP id u100csp1783109wrb;
        Sun, 5 Nov 2017 06:40:36 -0800 (PST)
X-Google-Smtp-Source: ABhQp+TZOsp0CkB5VG6x9aVpKSDfnIrNkUyDyMOQ30MJc32YegSvU6PBcYD6/pDua8ccZ9oVamZG
X-Received: by 10.129.158.208 with SMTP id v199mr8079852ywg.49.1509892836509;
        Sun, 05 Nov 2017 06:40:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509892836; cv=none;
        d=google.com; s=arc-20160816;
        b=oDiDSu7WQkROAOALypMkVu2A7tY64xDTF7QC6XvPgmMg9SoD1UyhSx2Fy+at+6ooel
         w7IKJaxOsil6M0XNbsOQwObKmvJyLvCDRWFzrs1IsFBiujJkayhGNdwVjnbbABQ1Oi2y
         +Gaf0SVbcvOcE3bi53CXVo7EnYit4Csl9q5FgykkTUroK8P6D/PxCvcvdPpcKy6abkoF
         gLT1P+92npm31Gen8g2HT6yZoVHsyYF7P/tpaN/aYGMWG0aryIKMhDELx1R8O8QCCUiD
         5SjF3S8QOCzP+1fgeyAOtSLiZGXD573bmxf+pHjKNI+s7OFTzWMzz8MQlOl8Zhblinn3
         Mnbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=b/p4yU4aKPpn2iDhslBpDDUJa+Z45iYGlLTVAsfUnM0=;
        b=v4LbZCAEmOP7qCKzBcprjfEEA+xpC6JBJQaD2I9OXATBmAfF+FW2yE7socEeF8QbX0
         zN0FjsFZ3FHVgszrHrgWS91x8d/eOe0OcWLl8pEaT+O1bs+D4hUgQ8SGfw2oZ0J7OqsW
         ds9UlEsgzft4ydM453KJYFYfoSSWhHrPx1pj7h0XCFXI/oj+Gd9SLLf6g5SL6+DWOZPf
         0jzl89nzBt+FEnlwyLejSOHTpIU2bs6m/xNqhRFOxHs89fJ6eHAn2bTqGE1/3TowaLQO
         kNMagvtWvRYi1JRo4A89UBWuivRuDAuu7TZk7UnTsnok+GVy18OtWy4v3/kqSrkiU4yk
         2HZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d15si2223770ybl.7.2017.11.05.06.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 Nov 2017 06:40:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44508 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBM6G-0006cg-0J
	for alex.bennee@linaro.org; Sun, 05 Nov 2017 09:40:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eBM60-0006ZG-5k
	for qemu-arm@nongnu.org; Sun, 05 Nov 2017 09:40:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eBM5y-0005f5-61
	for qemu-arm@nongnu.org; Sun, 05 Nov 2017 09:40:20 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:65416)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eBM5n-0005XO-V1; Sun, 05 Nov 2017 09:40:08 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue006 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0MJ1gb-1e8tFU1V2P-002Z4Z; Sun, 05 Nov 2017 15:39:49 +0100
To: Stafford Horne <shorne@gmail.com>
References: <20171103202624.5956-1-laurent@vivier.eu>
	<20171103202624.5956-3-laurent@vivier.eu>
	<20171104212011.GK29237@lianli.shorne-pla.net>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1356a4f9-86a2-7b18-a67b-93dc6dadec4f@vivier.eu>
Date: Sun, 5 Nov 2017 15:39:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171104212011.GK29237@lianli.shorne-pla.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:PnMzU6F/Rn3hEd9YiUSIwvcQ9tQhmegFXoF4fDlzGaZwohSZCbK
	rjPUYHUItnKe90x3bt0S4Kf3lnI9w5+ZeMkhmXQf23yf4xZSRCSuqtMapOhOU7rk13GMlNE
	fdWJm0g+jyBnth+qIhCNOAZtuAiKrkrGBInNYl8iqtclJG+LEi3uBdCRDPn4BYI2jyjJI/R
	RwFQNlgM/MKDgJBfSftWA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:KQYz2XUgBTQ=:ouXLCmcHqUABgm/h6JZTLg
	wNdrWpCtfsT+XrPXGWusw4xUaCygpMe1l7Ke9e4ZbvEtyrdgbrjB4OL5s/mgJsXcA2Iac6p0c
	roFXnLnV3JexqYpKsYa0te6ThO0Q6CTh/Fc5pPaJWsdQhgX7AQtDzK56epK1iaj2zdAXsBB/9
	LWSApDE9tttmCnWDAi6FM0IcS3UAXiLky+bUN/nMDg7B+RFsgZisgW5uMqeuuzLP26jmoNBB5
	V37gtjumJI+g/+ojsoDD4+UIr0OC2M1gg2rrTeW8b2Dqn4fasBtJ/6uywipLiC6Fxn6ACjXos
	YeUqU1+Z46haQDlV/LzrmpL4VqiSWBBoR6jnFGuwx87izt8aPGpgASrf1XMEVeICFcYKcdr4c
	XSZtP/DvbRTPiygAFm4pl1nquoPeZH/gb4F8jcMbEvDmsYoMTAk1a/ne3Rm3XwX28IzmdrohM
	qdujOyTpdj3OzqpelBnmyrOc6/NlXWmUO2GkGZKdPOyoB+EYkiQkwnAJZeLiz5O/woOuW+nxl
	LL4W0CQpkildFK2kzy/1Ta8Vc3E4Lp4ttRYOHNOnz3k+GjFcScRiXzR6TwK9bcOLHkcCyecwd
	GQFQx+PMxjRaPtjtt3LyQ8enKXP1ZxxmOjvNyRqV55rzrrvQELvWEZuDGCCCp5s+Gm2EuXQuz
	aOciVY2sR/0RYLayuagUp1LB927ub6vtm4QYF9PPuq4uVaoCt2HnoGyM56/AC8uCVx1+HPN5d
	ZCIylwDOl6MddQCXHJhdWsvTyb4VNcy4CayN9iMKQvdVEKx4PTsO0L/XUNc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.134
Subject: Re: [Qemu-arm] [PATCH 2/4] openrisc: fix float32 and float64 helper
 definitions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iUqqSP9dogM2

Le 04/11/2017 à 22:20, Stafford Horne a écrit :
> Hello,
> 
> On Fri, Nov 03, 2017 at 09:26:22PM +0100, Laurent Vivier wrote:
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> 
> There is no commit body here, do we need one?  I can see in your cover letter
> its mentioned this was revealed after enabling "USE_SOFTFLOAT_STRUCT_TYPES".
> 
> However, I'm just being curious why is this an issue?  In softfloat I assume we
> pack our own floats so having the type that goes into a uint32 register wouldnt
> make much difference right?

It's not an issue. It's for consistency. We can store a float32 in an
uint32_t, but it's better to store float32 in float32 type.

And as said in include/fpu/softfloat.h:

"Use structures for soft-float types.  This prevents accidentally mixing
 them with native int/float types."

Thanks,
Laurent
