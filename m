Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1483344ejx;
        Wed, 30 Nov 2022 11:24:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6Lqmt/s4xsKId9UKeAdkCDkRlzshjV/++AOVab4ZCEWt4VkvTymf3arSBk6+wIpVWI0Hal
X-Received: by 2002:aa7:c9c3:0:b0:461:8f21:5f12 with SMTP id i3-20020aa7c9c3000000b004618f215f12mr57570933edt.54.1669836257831;
        Wed, 30 Nov 2022 11:24:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669836257; cv=none;
        d=google.com; s=arc-20160816;
        b=dG5sZRtTLOXHuColaZiJ9s8Qq2x8GvgkIgOfxiN5kao5lR4GhAQiyHxJcJcFMk4Ft1
         Gh+JXYjSb4bu0qfhrMjMGtlu3cZxBMVsXlWrx55+Lg21XYFj7QtDOjG4KPYtTsD1oyGw
         SG1Lwa8u4QXiVwILAKNnQO7W31d7v9U18YGocYNn5lYioN8CBThbvhyIsNgKqc38e4HY
         p2NzFw4j1Fb9z9C/dqK5oiFd+Ys7N/TZ7lW5rJqgzNNxgNBz6FgBF87Bm0cTJF99TjOG
         xHywzMMKb1vu6c7M4aE1sp6c+zcxF9MIFqNk+Dsm2r4mqcTO0QxJ9Y9AJfIrDH+wgyOs
         z/uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=ui-outboundreport:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=uHqvc3aUN+Qb0anqE6jGw8PKnjUPlQ90+KzllaGdJHw=;
        b=qkVn1Oan4T+piADeMC1NQVnjMnjtrFfK62HIDYze2bmC9Gp2cnNR6CkSxWlTNwrPUZ
         KP8eKXYVrYR64bmaU+QF6z2BO66etPMBcSLcKx/ZdNrp1i6xYapEDNVkvpEg6IDgDAoQ
         o7Lg6X9RtBhEb4UGohs9rqCIFB9g9FAptCN8hnpDHkM5mYeq9SOuWFLLykvBilvYHQDD
         yfQZKgC59TnUk/OIM8o8cOwMWDCjU1i4qQACjEwGQQHhTUd5BzdKJ/WYmLNVCJXOPnIf
         vwGuJCImKPYrjfKlSqRrQ+4fDSLKqyfIFOU/yQOh/FVR3AayqN8C/4ak1CkPCDyZruCN
         xCgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=QppsumtW;
       spf=pass (google.com: domain of axelheider@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=axelheider@gmx.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Return-Path: <axelheider@gmx.de>
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.22])
        by mx.google.com with ESMTPS id s19-20020a170906455300b0073d71124609si1492684ejq.182.2022.11.30.11.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 11:24:17 -0800 (PST)
Received-SPF: pass (google.com: domain of axelheider@gmx.de designates 212.227.17.22 as permitted sender) client-ip=212.227.17.22;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=QppsumtW;
       spf=pass (google.com: domain of axelheider@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=axelheider@gmx.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1669836256; bh=uHqvc3aUN+Qb0anqE6jGw8PKnjUPlQ90+KzllaGdJHw=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QppsumtWAvzneJHheDEaxeCoypUWbsbux6icFltmSXzaQzBATflpJQPbsUtRDk4/w
	 JnqqHV27Yyt4HQrz97RPB7kihaA/qOgmQ23Xhwb9fzbvTnTJHHzkKxyNLBOyhQ/1+s
	 U6TJAGi4Q6v2NTub8dJeW0EsPjsatIV8JPlePdfna6qLX7H116qqxDfwpxETQ5J8Jc
	 Aq6JDdL09EZMfr0/dIkWpzNknh3JguMSzatJG+32gjDvXob5eiXmqpCoCgkqrTVXVu
	 t1TnHxbuI/hkIBgVbCNknjED/yfUOQdtnM6qc5Wo+j9AkOzqTcGlYR3ly7MeccoKMy
	 8TpFrb/tDScZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([77.2.55.175]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrhUK-1odCgm2IhI-00ngbV; Wed, 30
 Nov 2022 20:24:16 +0100
Message-ID: <6d0d9eee-b1b2-df62-1989-f29d53263af7@gmx.de>
Date: Wed, 30 Nov 2022 20:24:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH qemu.git 0/1] hw/arm/virt: make second UART available
Content-Language: de-DE
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, daniel.thompson@linaro.org,
 ~axelheider <axelheider@git.sr.ht>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <166982763526.10484.9925072056712598801-0@git.sr.ht>
 <87o7socl3l.fsf@linaro.org>
From: Axel Heider <axelheider@gmx.de>
In-Reply-To: <87o7socl3l.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:wKiHLlFK1wDPyNmU3S/b912b0bJsIFG7OfaXv+L2VEIwS3FsBtW
 OpIdo7mkp/y125Yh0yzg//GKJE9F1qIlmZmc5nbUQJvjYO2XSps4oXQN5zqSPlUs09rBtGX
 pqiSooKrK01MS1PqGpeSbZYwntrkUef1ig30BTcMG779iqEl0QF8+V1sL/N1LzcFL/AXWby
 8ZMC2BN7+sptFmYUef3vg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:V3eRq+soj74=;q51QfpzqOF6PWft9pBtmnKFOFwk
 COs62EFYn9V/+kdmJPYOetwzMz16v9623m2+/3bPYXYEg3lJYKKTxz57T9+XQUSlRYqDPvdHD
 EQcbnX/VUVwFHqn4kp6zUC9VmQ6B91zjdmI8nqnsZsH+/m1Fefg3IoKulkgsiu5R7QuZsS1VZ
 3YmvyMCy8C96qBSEJV3uU8lKIf1S9lUmRg2uyBi3KB8Ll4yVxKRcuMFdQk3EpM+JYbt0HTeg/
 Dcgz+ey6HmG6nKZggmZmcXz70qlFmbvUJijhQsakXf8eTUkji6q2bj6DYMd59vr+U8zVa0FLG
 yk/Iig0mqS19ASE8l3kaqa37SPsHdH8le/EhNIt/1rfvUAQfhGK6bDEutD5mmOVDBo6Z8Mxjm
 rpdqSIB2crKl7bPemCkNq8/oE3Ib66g2nzAYKrqdVC2pVmCGf2QkOVpYAh3r4mEy9dzS1QQGZ
 XqZCHSfLtqY6cWdPACCfUV9scZt6t3tuVz7WzbvuIZA3Mlwkuac30Vcdn6HTwb3kxHXw6+UMd
 dtBXxQfQCkvDAqYKfwT6k8JpauU0/On+xhl9cYshViKX7wd4BHNgJ/K6kirYd2nnnYJN5huIs
 y9YqWSyGlkRWNYF38c6BALDgNWE6ZIB/phleb1cGc/HUhaDhUSJgAreySIt5XGCgf+Oheja9Q
 wc/kn+CcoVK3urvCTsWRnR2TAOqTtLRKOkyv/XQ6Is3wof9PAmGzbyDoD1swKVu3lcbtS54Fk
 oLMfUpXFNVNUS0vfCvEcnv4+g56Sklh6zfTHorFqbJSq22jNAItIMkeqZodREk4gBuZgF63FF
 Q4/CLtP186xV9JR8Br+7LcMJPuH2/D7eniiqNxR1LG/oOv++Gl0XBiEJwMRl+VVSLLhm71iHV
 D5wHYt1NxwJfI+cppn24atc6S2czIIrQyFc4FQmAq82BDlett2WBPK9rhf+h2xApIA63X/0A4
 ozind1YUlPsNUhpzTcGFh9aO1AA=
X-TUID: 1X8BRqtrC2u7


Alex,

> It would also be worth updating ./docs/system/arm/virt.rst to document
> this feature.

Good point. I will add this in the next iteration of the patch.
Until then, the proposed doc changes can be found here:
https://gitlab.com/axel-h/qemu/-/merge_requests/1/diffs

Axel
