Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp35851ejb;
        Thu, 16 Nov 2023 15:27:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7DBC3rptFtKL23kgQLVPEjH+eTFyLjnefEyjSg5dw8JBP8Zfj/hV4PZ9wqW6AzFGLnJWD
X-Received: by 2002:a05:620a:3901:b0:777:5d7:d62 with SMTP id qr1-20020a05620a390100b0077705d70d62mr11807920qkn.13.1700177273925;
        Thu, 16 Nov 2023 15:27:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700177273; cv=none;
        d=google.com; s=arc-20160816;
        b=WRFBxNdYqNtMCbFb1acDaGw7A4bWGj4CluLjgZOxVLoL6kZwynVN1cm5sFSuaKeNO9
         meqmu7fLNlWMILBGlYagEukM5s0DtTiewwQ9Wy/1vlu2/sIawfItuPjrkcy6kZh9Opu7
         R+aFNAQJDVANwMeQfA2pJCRxneVx0wln3fhBwJJ58WOmLWhoxNexsVmgYfFkd2tZblcu
         6PE0aMaheo/1f3Gj1E6jIAqOKezCxZyYi8wpacV94GjGgog6DDHaBw7kXhBnsbBFLIHm
         RBqcIPuzK2UQj+hqjv8LFQTrsGUrNVSn6w56wVyeG3v1A/YrvJF4kCPGwO6o6fuiLTIr
         vIdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bsVUf95nsvz8HsXCQuGgq3Eei7P+SUSqTDa5H9h4TAs=;
        fh=a7pXOaTBsSHAOcDhqYGjai0RHNA6jEApxyxU387OqdQ=;
        b=ImbRulCLUslC2LJBRhIjbfNcdTJ9cZy17DLqy/+6vgikAt2X7c/wMkLBMi4drcmFvB
         hgoRSjcgJ3Q17fQ//R7/CLAAyoSgHlEKK9hNmmZNrfyoZ13FX9/0lGFWEzr1FdFMekfz
         o3wg2fCMxkUiGOCUpAcZIGaOG5ob2K87z0/BXE9EaNwBAF/1ILjCevrmGcjX5aSXq0Pq
         /lfDBrp8LuKvmz8WduM9BGB/GiUo+5MfQ8BO1X0K9U29UA5zKKguIIuKQrFDwJS/NOg3
         iXDkihS6++qkOlsygD8IygiwlGMiJTWc4GPr3tsk7e5jZdTsTQ59pxtJ2mfA5LMjEz6i
         fliw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GncoRWWW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi26-20020a05620a379a00b007758fab8c64si471046qkn.518.2023.11.16.15.27.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 15:27:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GncoRWWW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3llR-0005kH-R7; Thu, 16 Nov 2023 18:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r3llQ-0005jw-FL
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 18:27:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r3llO-000399-Od
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 18:27:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700177229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bsVUf95nsvz8HsXCQuGgq3Eei7P+SUSqTDa5H9h4TAs=;
 b=GncoRWWWLsKVCCvVH2ZjTj6G7kf2P/ROh2kX7psMEccwp0nM/CfLy1/+8dG5z1Wdx9e+Ma
 aQEhKAEZw+jGiAYr4zrx7Ir4pb5qSh7cZveMzotMnhM+Plns5SjOZtO6pdcZ8FaJderb2l
 yGWPwnP4Bix5HdeL1NCuxhLZFwZ6i6A=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-Gd7H5LHOP5OmDx7-DzKyYw-1; Thu, 16 Nov 2023 18:27:08 -0500
X-MC-Unique: Gd7H5LHOP5OmDx7-DzKyYw-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1ce5b6ec63cso4507955ad.3
 for <qemu-arm@nongnu.org>; Thu, 16 Nov 2023 15:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700177227; x=1700782027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bsVUf95nsvz8HsXCQuGgq3Eei7P+SUSqTDa5H9h4TAs=;
 b=w0ltRnlXotzMIhGL3UHpy7u/shlMl4Rnkxj1whS6wIPT/I4jhJQsm+PCjDzvv3QlqQ
 A4ifMqyFLXoBM8TkePdS9yG8zTTXgZCtdJTDCWzAk3ERz6J0L3VceDGNQyIro8TklrQc
 cAOYZ2Rrr2I+ibH3x5pT6cDtivTywwTezGMaFFPEoDkAbnoZZVIhpdD+lLfHMswYfAzb
 DIT2QbM9gm3pVtn+aOIG9ulEEd9BtnYk8WXZ1DRhvr2CLkJB9E7dTVhRrC1aNlLCuiBz
 SsktdyByMea8Ir+rTDjAiO0zmBlUOp3sbsD+Jt3t+ebe5hFOULZwMg9aaoYdEIp1H/wS
 7lEw==
X-Gm-Message-State: AOJu0YyangiI6Ix9SgE+OLjwXWeQY3jBvnJV5Retand81NS6yr0/3cZx
 UetU7nDYoJznmI+JUHtDaVfSK/Jo6zFck1Dzt1YEc7AUEsy+OaAZjSM3Pr3XYwNQBExihQd2vv1
 +dZRy1c4XvIBc
X-Received: by 2002:a17:902:ecc8:b0:1cc:3875:e654 with SMTP id
 a8-20020a170902ecc800b001cc3875e654mr12056118plh.26.1700177227037; 
 Thu, 16 Nov 2023 15:27:07 -0800 (PST)
X-Received: by 2002:a17:902:ecc8:b0:1cc:3875:e654 with SMTP id
 a8-20020a170902ecc800b001cc3875e654mr12056063plh.26.1700177226745; 
 Thu, 16 Nov 2023 15:27:06 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170903230800b001cc0e3a29a8sm202183plh.89.2023.11.16.15.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 15:27:06 -0800 (PST)
Message-ID: <7252553e-9ab3-4c8e-a867-55c57d0178ba@redhat.com>
Date: Fri, 17 Nov 2023 09:26:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/31] Unified CPU type check
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <efc49f7b-70f5-4ce9-8179-79e8a6abd732@linaro.org>
 <78526851-6d44-4c18-97b8-57462fb42ab7@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <78526851-6d44-4c18-97b8-57462fb42ab7@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.117,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bZ9dLeRQ3p+Y

Hi Phil,

On 11/17/23 02:20, Philippe Mathieu-Daudé wrote:
> On 16/11/23 14:35, Philippe Mathieu-Daudé wrote:
>>
>> I'm queuing patches 1-3 & 5-23 to my cpus-next tree. No need to
>> repost them, please base them on my tree. I'll follow up with the
>> branch link when I finish my testing and push it.
> 
> Here are these patches queued:
> 
>    https://github.com/philmd/qemu.git branches/cpus-next
> 
> I might queue more patches before the 9.0 merge window opens.
> 

Thanks for queuing these patches, but I don't see 'cpus-next' branch
in the repository. Please let me know if I checked out the code properly.

$ git clone https://github.com/philmd/qemu.git philmd
$ cd philmd
$ git branch
* staging
$ git branch -a | grep cpus-next
$ echo $?
1

Thanks,
Gavin

