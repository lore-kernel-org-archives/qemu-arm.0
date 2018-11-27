Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1176100wrt;
        Tue, 27 Nov 2018 04:04:33 -0800 (PST)
X-Google-Smtp-Source: AJdET5faPCmUA6l/txTR9vAVB57WBzw6YHdkjTjwyj9BXy0rNOpjPruFJr2+XvDIYEERFxdgsfPU
X-Received: by 2002:a81:b623:: with SMTP id u35mr33621286ywh.177.1543320273721;
        Tue, 27 Nov 2018 04:04:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543320273; cv=none;
        d=google.com; s=arc-20160816;
        b=DMlMfxjgIjwQf7BuCJopVkguwpB8pxsbgUOw3eYkKiHpsDI9kecpKZwVuJxilRMhjq
         P2Tm4m3ZFwQAf7m0GY1Dq/8qjzjRoZsTU29vuNRklJ+ot7goUH5l8rtX4CkhJ+AqMRsx
         FrIqKDgO/5TAHetVwK5A3RTmn9euAgGTulY2Bn4sTCGr4JHRU9uSCOC4xVEvkq/jSbi/
         /789hOK5slIb/sT3smosR4w60E+RM0Pb6U/Cx2wyZD8C8NA6tJZk3YqjkShFUEa+Romj
         4uZujR7L/5X4Pl9DMptmoKzgiida619DkE1jCnXOKsZtq9XT2uPoJIj0s1SFTVNZVKbS
         Rsfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=nOe9ilNFzlf2v+QcXii12gCDw5O7nFvh6CdMy30t/s8=;
        b=bBcE59ywf7kQMHmFhQ40CBb9K5SunU4W1EyXqYn4zcrI5fJi0IsRKGr7SguozOV0e9
         TweOuxOx9uoj/x5ePAZJAr7D8EuNwwhJydNl4cEA1fnv8BI0yAfTkWXoiEx3Z+hYovSA
         ICrOYe7HcFiEtrg4gAVzlbavlFnYycM+lz0s3fZtjwb1vZwDlcbE9b3bgYFJ2FdOG3lG
         zzXnLyyd+Jio6M2ibWYHHINj/YM6ixDGc2PyyjFlgdaQZl4sz5HvkERg2FZ1GhjVJssP
         M+lpcEM7GfeQm8m4heQ4eNKxEeHwmLeMNRsiLryuqkRyTWqbDvm5zkMH1KYSZX6P9jOX
         ABEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a123si2551588ywg.39.2018.11.27.04.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 04:04:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRc6T-0006X5-8V
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 07:04:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRc5o-0006Po-7g
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 07:03:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRc5k-0006tY-PD
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 07:03:52 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38685)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gRc5k-0006sU-Ix
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 07:03:48 -0500
Received: by mail-wr1-f67.google.com with SMTP id v13so18947355wrw.5
	for <qemu-devel@nongnu.org>; Tue, 27 Nov 2018 04:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nOe9ilNFzlf2v+QcXii12gCDw5O7nFvh6CdMy30t/s8=;
	b=JPJsjLRq4ivrfEGAeaShu11O3rgDq49PCerRx7E2fY2J/PGsKS0wocSxL3K4/OXDnC
	FrlEChAdBJDlN6tD9N2WxFomGjZ4pmPYOPJqxHeZon7FmXO9qizNAshbXxIvzZtHkT5A
	0ILfWFEotk6CLA5E+l15B4e6OcXh277+r9OilO9FTk7/0zX0IeCAo7Dj3U3wdmmsdgnE
	67eYHkEIqwIiW/zt0olGLEb0nu+BVotaZxfUrFsRRv0rm3P0aPvily+DYmzyNFiWmGSx
	bBTBQ09QN7O0YEMtj03I9tu7jxxTjnCem1T8ahCOjWn6v0peINOHUpYNL0ZzDtiyy5nw
	KbDQ==
X-Gm-Message-State: AA+aEWaFuXcsNaTyuI4rTWgcLa38RGsxabAZgJuok0/xslQATjKVqwaa
	opAv4PfktlGr2jhINENRWL2yr+1PeUc=
X-Received: by 2002:adf:b783:: with SMTP id s3mr17064998wre.274.1543320227224; 
	Tue, 27 Nov 2018 04:03:47 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	v189-v6sm5707536wmd.40.2018.11.27.04.03.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Nov 2018 04:03:46 -0800 (PST)
To: Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-7-philmd@redhat.com>
	<bbd65041-d216-f063-8d94-a11db5d730c9@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <b4cfce9d-91bf-2085-71dd-4c1c1a5f17b3@redhat.com>
Date: Tue, 27 Nov 2018 13:03:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <bbd65041-d216-f063-8d94-a11db5d730c9@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [Qemu-trivial] [PATCH for-3.1 06/25] MAINTAINERS:
 Add a missing entry for the Xilinx S3A-DSP 1800 machine
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vN6CkstIDC1T

On 27/11/18 12:37, Laurent Vivier wrote:
> On 25/11/2018 21:49, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4e396cbe71..aa17e9bbd3 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -822,6 +822,7 @@ petalogix_s3adsp1800
>>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>>  S: Maintained
>>  F: hw/microblaze/petalogix_s3adsp1800_mmu.c
>> +include/hw/char/xilinx_uartlite.h
>>  
>>  petalogix_ml605
>>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>>
> 
> I've added the missing 'F:' field.
> 
> Applied to my trivial-patches branch.

Thanks Laurent!
