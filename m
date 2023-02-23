Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp853199ejc;
        Thu, 23 Feb 2023 07:57:30 -0800 (PST)
X-Google-Smtp-Source: AK7set+DK9F5u5xrFeJgzhj4tUqXrHMT/k9+GIG6tpi88W8eeIKpm7+b2Tw+V4GIulEha+jpJoAR
X-Received: by 2002:a05:6214:625:b0:56e:b273:fb53 with SMTP id a5-20020a056214062500b0056eb273fb53mr26854800qvx.49.1677167850779;
        Thu, 23 Feb 2023 07:57:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677167850; cv=none;
        d=google.com; s=arc-20160816;
        b=TZgzLSJ9zfh6xoolBv4YSMttUwMPe0oeNeBU8kdpXpSNbbhVx+g+lXY9RgJ5F+HDz2
         AgdyDOi7Ynli2F4pqN6bKBJjz9ZHfqgba4smirtJO8x2dnAzer7Ma57gxtoXm7rY1EqQ
         4fDFumqwzWfp3iOlP5ySAjyZmscbUVBgrngbffzF1jwIkCQJDHKIWAmw1Mx+x+jdIJvE
         1ZKhJbo2ck+q4+3hv6peSfoRapoe1/SQ1cyopq2DTOqPC0ye85L0IOMNyIgs04oQSpfs
         pGvJbumvIi9CJBSg84wmGBcuuAuHYEfAGavWdWyRMRgGp7lJyJoRWTFUwM7Jmhsorcup
         3VGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JjpJJKcYZfjqUF9ko6RIgW5+1PMRirUCNS3z/Pptrjg=;
        b=GyLAsDTXIG1fM+pBHpBdszj7JYwmvVeAPFl9BMe4nqLoez0FkaEzvUgUBjEMf9nSgU
         csFANtCiEMNWa9vrTVGyQSqR4xOxue/JK210h2sYd91CjwOYWnn5Vd/PZQip+LrtxbqV
         CzGaIkQmmQPMTqeVMNDEz4FA3N9RjUUmJu3xGZKHT773ujfT0R1ll1PE5IjaEu61oSg5
         o5vF+aIu1oa5gY7aH0g8+CqdjdodwxVOcABAAWR8EzSnaKoMRfzVfvXxkNTUY4UV6GrB
         9sP8g5S+uIRAXBh4bxXgHIRc7lIzt+WHmjO5f4/Ro3DHHF41vKlFapwLyHomSNWuIfxw
         OIaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eUREvyP3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6-20020a0cdf06000000b0056ec2d9f293si6721718qvl.344.2023.02.23.07.57.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 07:57:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eUREvyP3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDy9-0007cX-Vr; Thu, 23 Feb 2023 10:57:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVDxw-0007RA-PH
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:04 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVDxu-0004dZ-1Q
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:04 -0500
Received: by mail-wr1-x429.google.com with SMTP id l1so10770843wry.10
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JjpJJKcYZfjqUF9ko6RIgW5+1PMRirUCNS3z/Pptrjg=;
 b=eUREvyP3SJo9eQfAz1iq/O0WBPCcL4muurCPzdt6I4+juOVKBapySaWtbwav6acvrr
 SzlFUNlRRztVon73NX/ens6CQO7nOuzsu6BNEnVWJ+bpfJfeMwcizvcIjbNKJDPx5CeU
 EjAsmbmtZtkZ6DNcw+cq9FKaubb3XrqTp+DpfSXRVYhaOOxw836nBcJpm+eSUm8Wbvue
 KSisyNS+hIcDaRTXDt91+jb+6TWqWgMfvb800sNg86NR+Ot1EDl1KGbY3Y/QW9+xHv16
 VUDymk7fJ1/xiCqihYwS1kXcL0MfwodcCVLBlV5uAIrppcfayV3I0rwTUfBf1xNFJQiQ
 pA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JjpJJKcYZfjqUF9ko6RIgW5+1PMRirUCNS3z/Pptrjg=;
 b=kibhDhQg6SAlz2PHF4NXUg/5KP6AAyxFsgXpf4hzBXK0RTYSoQfmO3obX5JJjjEqv+
 i9+UPjAFoX927h7fLeV1pgqkWBXL+GNC99/CEdsqqTWSwBJAAjvz+l+Si4KI8iDyGLqx
 JFPR1k0wZD0kWrfyA25cdEtGW6UmZtezf/r0IMZSJa6RxxmoUGHo+WcLQQ2XABuMZy/P
 +4iVrpFAltSK92MbPTHILnJKg4G0/a58ky+dur5nTaY+BgxI62qFqet6CH3icwQLbWQg
 xvLEYACroF+JqB6NzBDthAwGhdf5oXyDzgSLuaGNyabDck6xUZS25yNZmJj8aQ9Borwb
 Kc/Q==
X-Gm-Message-State: AO0yUKVPDK9TGY7wigGg6USF68aPr8afvnkNrEFSaumgIVY0Yl8Nu2em
 QDNNEgn7LsM7msIfElrWH4zZXQ==
X-Received: by 2002:adf:ef4f:0:b0:2c7:763:8b37 with SMTP id
 c15-20020adfef4f000000b002c707638b37mr7419830wrp.11.1677167820296; 
 Thu, 23 Feb 2023 07:57:00 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j29-20020a05600c1c1d00b003e204fdb160sm6568908wms.3.2023.02.23.07.56.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 07:56:59 -0800 (PST)
Message-ID: <d3dae20b-81f7-5727-882a-3593ab2996f8@linaro.org>
Date: Thu, 23 Feb 2023 16:56:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/4] target: Restrict 'qapi-commands-machine.h' to
 system emulation
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Song Gao <gaosong@loongson.cn>
References: <20230223124340.95367-1-philmd@linaro.org>
 <87sfew331b.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87sfew331b.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sDCeUt4/11uO

On 23/2/23 14:49, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> All series reviewed, can patches be picked by corresponding
>> maintainers, or should I include them in on of my PRs?
> 
> I'm sitting on a lonely patch for the monitor subsystem.  Want me to
> throw in your series, so my PR is a less complete waste of CI minutes?

That would be lovely! v4:
https://lore.kernel.org/qemu-devel/20230223155540.30370-1-philmd@linaro.org/
