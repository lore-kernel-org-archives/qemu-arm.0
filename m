Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9235800lfc;
        Fri, 19 Feb 2021 10:20:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoWgY7cGb0kXWmBHLQtLP4DF3Ss79obKVB1Vnn4t7i65U3UPD1iow1IbPtZlm08c+kHj/r
X-Received: by 2002:a25:2f43:: with SMTP id v64mr15404857ybv.302.1613758839466;
        Fri, 19 Feb 2021 10:20:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613758839; cv=none;
        d=google.com; s=arc-20160816;
        b=Wn9q0TofAOSpdveJIirTgGpUy+g7WO3v6ioJRKW+GThKMlHyotMUFuVEivKu3EHBnq
         FQq0GUTAK5y72TN3fWwj/DAtI+KM0SO9N+34ClXRwqOGJoPGma34vwKvvPZt0liFzTuT
         MqMLhQEda4MiPkEV6TtlhEP5HvU+aGks7bNwWvlBWNiGHcy0XDq7D+6ROtHoia5TFnry
         csT4fS7jL5YNqrBlsG63Q9hNRXuUGhfj4oJJWRxoxtxWxPMpPKRqAOQ2tIIk/9AuxNwf
         nOA0YRBubSTn1J+rIEBxZPMAT6en2H8AK00QkzXfrcOryRgp8MBB2DE1sKzdWlnRaqiE
         cijg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:subject:from
         :dkim-signature;
        bh=QWLOIiitmqBo5+3UaA0iJ43f4RC209g18TM/vosn6KU=;
        b=W1/n92zoIY1WMREOysM2gc4oNCsFakFuzKpFwlJ25yJLlQJi2ZiA2bVtJn0h/nlCJk
         pi1pTLJuo2gxTVLVcpjIqbFkRL6fsfoKCzBZy3KqLp/JdwtRbva2hLJT/fY0jy0qC4Zm
         7El8DIoJm5HwoB+TWSohTt1PZLjXYSk8kwE9XzmXMTXyrKg/YvRe5vkhQhYWPn8O5cg1
         vRefVwJooq/afMKo3p1dmc4rqohug7S9LKvAvTHj5ZSgvNBp1efD39kYmPJBEIsOFTiI
         4NVM8n/kVGvjQAwYQXt7uPy4hgPKrQgqH4rNxbDS0JqN6zbXe2Mb7LmiKLE20HLiNzk3
         x+Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=POVBAu9h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p64si9100252yba.44.2021.02.19.10.20.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 10:20:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=POVBAu9h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lDAOM-0000BO-RA
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 13:20:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1lDAO8-0000B4-HT; Fri, 19 Feb 2021 13:20:24 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1lDAO6-0000mT-Ro; Fri, 19 Feb 2021 13:20:24 -0500
Received: by mail-wm1-x32a.google.com with SMTP id o15so7814947wmq.5;
 Fri, 19 Feb 2021 10:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QWLOIiitmqBo5+3UaA0iJ43f4RC209g18TM/vosn6KU=;
 b=POVBAu9h6VXtheGXvk2NfpN7VuXcoirzXDBHZeSRMcMGwnLtXNDmDnbRloswSncCiu
 UUBmOonAiKAxfUdgfpFKvVHNlcCFmDWcmG8TCbHlREKDdpiW5tij6aSeDioQohoQDmeC
 l2FziYTXDZmhyOPKjnAEbFWKjYxdlG6G3js9cUC1ajMTGuLS3fEZNPbSMl5onWT1CxdM
 Q2YUQQV7bJTmWqgCLcKw5KDw4nOFUtWukP3ASDJiAqkYmBSvJTP2EuipIaJIBK23iSfg
 JQjIFR1ep2dPw3zIHeetdBiKkyAERCkBqJuP8d2NkTJ+YjJg4vONwd4TsJwMnLvHRhe0
 xrxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:subject:to:cc:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QWLOIiitmqBo5+3UaA0iJ43f4RC209g18TM/vosn6KU=;
 b=AURS/4ne9tMJV+Px9ryZGoWjugSWAtvs+E/4LrPN0vA5Tow7ERpoUsYmbqAdcWwNo/
 jR+psyx+V7Wx6SAEQRBU+tjySiS86QMyZ0Wa5ZWTvjbBvjNBiVaLbqarlipjUKJFWJCe
 TrAzamXcSrV2z8DVDCXRotEubbkihETqWThMdzlpX7MIyrfy+eJRmHki74WVaIuVQR3i
 h3Hl2J/MD9M8P3/kgXgi7yW71nFNC4+iIkYv6CKteG+v/dhwAcQZ/K1b/vaHxwumwR2f
 woVqKZ19rsHB0aCcF4WGlmc76nLEJXng9Sd/8Iqe0hKdQIqYzyK9V+r3aMC15K6e8OGl
 oeOg==
X-Gm-Message-State: AOAM531N83AURT4HmKtYRo2DsCHeIBaabIfrKfrZmvrfLpiYG5Lfexfu
 DznDQj6emhEQNwOFsLf1fLU=
X-Received: by 2002:a1c:a795:: with SMTP id q143mr9362251wme.113.1613758819494; 
 Fri, 19 Feb 2021 10:20:19 -0800 (PST)
Received: from ?IPv6:2a00:23c5:5785:9a01:101f:7370:9e02:844f?
 ([2a00:23c5:5785:9a01:101f:7370:9e02:844f])
 by smtp.gmail.com with ESMTPSA id y16sm14031151wrw.46.2021.02.19.10.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 10:20:19 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 09/11] hw/xenpv: Restrict Xen Para-virtualized machine
 to Xen accelerator
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-10-philmd@redhat.com>
Message-ID: <f386d7c4-f139-4f17-4e5b-5a3c5288b238@xen.org>
Date: Fri, 19 Feb 2021 18:20:17 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219173847.2054123-10-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7MuPpJNxQoO2

On 19/02/2021 17:38, Philippe Mathieu-Daudé wrote:
> When started with other accelerator than Xen, the XenPV machine
> fails with a criptic message:
> 
>    $ qemu-system-x86_64 -M xenpv,accel=kvm
>    xen be core: can't connect to xenstored
>    qemu-system-x86_64: xen_init_pv: xen backend core setup failed
> 
> By restricting it to Xen, we display a clearer error message:
> 
>    $ qemu-system-x86_64 -M xenpv,accel=kvm
>    qemu-system-x86_64: invalid accelerator 'kvm' for machine xenpv
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Acked-by: Paul Durrant <paul@xen.org>
