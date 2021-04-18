Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp126597lfb;
        Sat, 17 Apr 2021 22:37:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8T93MIdr8gP7LTCrXlmVv+J+C+65suHRP01Pv+BnkLiqiVg/EusXlbxhCPRg/pw6zG4zv
X-Received: by 2002:a5d:8b01:: with SMTP id k1mr8889303ion.127.1618724239168;
        Sat, 17 Apr 2021 22:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618724239; cv=none;
        d=google.com; s=arc-20160816;
        b=Ga0uK7tIGGCWSq133FlKHuI9Uc7cGQ/b5Pe2wl/2WWry+Jy0DE1z44b3LV7NqJVMkI
         N6OaSsiRPBKtPvehZcDtuPWCbWJWznp84qmxmDHmhckjIGhtGbfVe9q+6i3qlXiVsGsU
         /ibJROITpFgPxk6Umjvc0OS1Ft15ErSrLInJhKT6hzk1U121OLcNlAyB9nRtW6PPKCJJ
         mqyk/xlaxnZoL+E1952Nggwi/uOm8/FFEZR/NY8JW39W5wA/eVl0KA90hOcQ9u+C6uZe
         3qp6MnVZDUw/9rhrsTUHQkNATBH7NBBzZZQ3b8pWA/7XWRqvesyeP7caH3Pos9EHPxzJ
         fvJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=eCMa9Tew9oGOz6VmJ4tX9aEKWxTuKkKtXSLtu6K93E8=;
        b=0QSvRITJ7m796GOyKeZ5ec20ulLV2U5ZbX7q3L6MKC0a6eZIcKJLMz2RAG8B4BZ+V0
         MYU4NCum4UIIJZ8rD8M053gTbN4JZ9oHkRVXfBUxOp6PHJk4xThhtPy/lNgvCyOpRsW7
         5gNG4553fKsf+MXOh+6oISDU5J1f10xH67iz6xjDhmcupv6GwL7w2x+AinQqTLKs4O15
         k11X9+A/QairPK/9p8zMbjHfbZ9qA/qlhC7rwVbActsuNy+xj3Bbuz+lo1KWNK76tOKa
         BY1fHdmKTd83k/PnyQTHibtnKMYfZeEiqrGqC58nivNMEKF92vhviP5iDh36Yn1VG6oz
         pvMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hXz3CKaw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q19si4141677jaj.123.2021.04.17.22.37.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Apr 2021 22:37:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hXz3CKaw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lY07S-0006kT-Ix
	for alex.bennee@linaro.org; Sun, 18 Apr 2021 01:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lY07K-0006kB-EK
 for qemu-arm@nongnu.org; Sun, 18 Apr 2021 01:37:10 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lY07I-0007MU-J5
 for qemu-arm@nongnu.org; Sun, 18 Apr 2021 01:37:10 -0400
Received: by mail-wr1-x431.google.com with SMTP id m9so17852402wrx.3
 for <qemu-arm@nongnu.org>; Sat, 17 Apr 2021 22:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eCMa9Tew9oGOz6VmJ4tX9aEKWxTuKkKtXSLtu6K93E8=;
 b=hXz3CKaw0gohCeAw654inGSYMfFvfgLQ2Xp323a9dTMYzyVXZSAzOGhYrSFkUdDkWH
 lCoXFOpC57ano4Gs7VTX0id2+Gk6rHY00q/1TQ74aVdO98JbWpU9hZCcDx6t5CKFoht3
 xLDQIp0FDDsswVfjeUit6Wkx5BMjv208mUJdCM9CZTAhA0wjov5+bDsqasWudenKOBkh
 Pt7nE7jomKPtTj8jdG2Y2JBPh6bFNAegJD1nod513g3rH3WcgY45K1dNea3xt8TjtNXH
 sVBB51mBKri4rkUfa4rl4PXCRNa5iqc+XY1vVw/BXAB0Rz9zRBtHlM4XfAv+P+Yf7PkT
 AyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eCMa9Tew9oGOz6VmJ4tX9aEKWxTuKkKtXSLtu6K93E8=;
 b=ibOkiltNXVBP0kL90aQpg/MRp0aTqhwfAqPQb83Ut6tl4R9EheJZ94l86tLpQQkCw3
 7w3YBiHGHZG00HbfUra2qoBCFeShL7qdU/UpR4sIng2Ja83NFXHs2R9NrJOIR0+F64b+
 Kkj4gUtIhcV09l0UIIFXMQuIFRKmeN0YucLiFxVbKdszNuj7GoXwIA9KVL7yeNIa1FD3
 YrXZeCcK/SuSwPT6LLJWuG4ocwGeXzzOc/cQ33x2sJuDBgLuur+MtG8Jvnkgv2uLT6fH
 xG51ozCmQxD7ygWIKSFonSEbs8UDzjoByvdqhbWhuwZh5uVJPquxvllayhUZKAWXTOiQ
 oeWA==
X-Gm-Message-State: AOAM530MOTB1YpxZLApjDKqKwSTyXFPTxd39CfDxSG1QJTTw+HpySsTo
 rDbti4dS3zi3A3Iq3kCnicnQ/HqM/8xXbg==
X-Received: by 2002:adf:eb0a:: with SMTP id s10mr7460753wrn.6.1618724225209;
 Sat, 17 Apr 2021 22:37:05 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id q10sm15254460wmc.31.2021.04.17.22.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Apr 2021 22:37:04 -0700 (PDT)
Subject: Re: Emulation of armv7+e1000e+/dev/sda or /dev/mmcblk0 devices
To: steve freyder <steve@freyder.net>, qemu-arm list <qemu-arm@nongnu.org>
References: <b5aa5292-5088-fb31-24b4-c8fc202413fd@freyder.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f553a91f-5f7a-f7a1-242b-00406e43dc20@amsat.org>
Date: Sun, 18 Apr 2021 07:37:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b5aa5292-5088-fb31-24b4-c8fc202413fd@freyder.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kxHQL8T6P7a+

Hi Steve,

On 4/18/21 3:42 AM, steve freyder wrote:
> Greetings qemu-arm group,
> 
> 
> I'm a new qemu-arm list member and looking to get an emulation of an
> armv7 processor with a PCI bus, supporting an e1000e NIC, and some form
> of storage device preferably SATA and [e]MMC - I have an iMX6 SOM custom
> board with an e1000e on the carrier board via PCI that I'm attempting to
> approximate.  I want to boot U-Boot (I've built U-Boot 5.2 with support
> for MMC, SATA, and e100e networking).

Did you look at the SABRE Lite board (which use a i.MX6) as a start?
https://qemu-project.gitlab.io/qemu/system/arm/sabrelite.html

>  I have the "virt" machine able to
> boot U-Boot and see the e1000e, but I have found nothing that allows the
> booted U-Boot see any MMC or SATA devices.  All attempts to use -sd, or
> -drive to create some kind of MMC/SATA device have failed with what
> appear to be (as I have been able to understand) the standard reasons,
> missing busses, missing properties, etc, etc. A majority of searches
> result in documentation from developers that's 5-10 or more years old,
> so I'm hard-pressed to determine whether this is my own lack of
> knowledge (probably YES), or whether I'm simply looking at stuff that's
> been overcome by events.
> 
> 
> I apologize in advance if this is not the proper forum for this, and
> will happily take this to a different forum, but is there any chance
> someone could give me a clue about the right way to look at all of this,
> and whether there's any machine or system definition out there that
> would support (or be a starting point for supporting) what I'm looking for.
> 
> 
> Thanks in advance,
> 
> Steve

