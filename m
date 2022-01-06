Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp969355lfb;
        Thu, 6 Jan 2022 04:54:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycVj6zdlIZM0Pkq5UciKhj6+hnYR4L+TxOmH9JH5i7GZU3XIfC1hAtdrGW/4ZRBvMib64l
X-Received: by 2002:a25:34ce:: with SMTP id b197mr57186992yba.488.1641473694075;
        Thu, 06 Jan 2022 04:54:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641473694; cv=none;
        d=google.com; s=arc-20160816;
        b=n5AsgVC0GOKCBVZGbXXzk9HOI7uKUITUa6oQuhiv7KAPNIfR1j5CevZUjoaofqVEj4
         3VFEELnuw7Y/iI4yNJK1XQxZpHY9bKDLMQ89GfkAsfRiKGFKcSKcZHjmxkmGmz4sdLkq
         +bdd4z6XA79aCDaOk0Oz/cK2jLpBe9m6a5nQBZCkDJjJ5fk8juhLUAgTjNze8O6oGf7t
         2TYZ4MXlW40UTo8hDoXencnNcy1Qep4AhhQ7ggEc5NEZTVrQSL760lD7yVPejIl6DHot
         D9GdgEnFUVBx87wW25tPeGop2g8d0QzZh94cUWAtHjC6X6K7LMIPm3ZIGnOjC0AcovxG
         h34w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OG30ocvVAXDyWITIlEJ3I4ogqDOLn0u4zkrbkseT5DY=;
        b=r9ArUzen+FRD09O8om4XLce8efNsu0giOTG1Ja2W/l+s76f4CExHtu2Ptt22W/+LyV
         GsMLS38yC0it0DJeKwVznYWWmavymZAscxyuCIqNdbG6x6SwbvPxD/Udtlw7rWGa6lmx
         OtrodFS2CecnUDOsWo5sFz24gqVFYSztgPxS8PeySfaAF3lngZ2NxS3uVkeZER7FsUPW
         KczP7lZEiAYa3EHxcvOKSs6T2OSqYU7ZjIFcggBl2sFny2xvbdepnMU/Wjq3zNjEeubk
         hehIZRwe2Mww3aG1EIGJPPK20KGYKMzFqobqpuXUaV/6ijAopwgr61V99GPv7uS2ekbb
         neyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=bpbq7ihy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x190si1517398ybg.54.2022.01.06.04.54.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jan 2022 04:54:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=bpbq7ihy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5SI9-0002Wt-He
	for alex.bennee@linaro.org; Thu, 06 Jan 2022 07:54:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n5SFV-0008EQ-B0; Thu, 06 Jan 2022 07:52:09 -0500
Received: from [2a00:1450:4864:20::42d] (port=36383
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n5SFT-0007tw-JR; Thu, 06 Jan 2022 07:52:08 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r17so4607982wrc.3;
 Thu, 06 Jan 2022 04:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:to:cc:references:subject
 :content-language:reply-to:from:in-reply-to
 :content-transfer-encoding;
 bh=OG30ocvVAXDyWITIlEJ3I4ogqDOLn0u4zkrbkseT5DY=;
 b=bpbq7ihyHgZCH7fiUES1qnoOSj+bbDiY+wlLknGZ0EPGjg3Cnf42aykHBCN/IP1rQk
 r5xZwKXcZFLXAUe5pmQi2Cl/x0OxOelHB1MyKM+FS+X37cjrOlzt8PeZLfB3h+9Qcxzh
 Cc/ovjpVF5QFUe4WFzHZgScL28RKw1uPpFb0Ob7HEXT1oRGiKAejMQxs9wHayRRySOKg
 z7QTkvW2WdMdjXTB7wQVEuIVGB3TxWkB26QKjUVfke93AsnKiALnLlAS/kNm9FDszTM5
 2tik1RH/5zVZXDQmsSOBOBatyzNZd2EveLdu4aRYLYIyqHArc/DKc74xife4TbFuxUCv
 86cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
 :references:subject:content-language:reply-to:from:in-reply-to
 :content-transfer-encoding;
 bh=OG30ocvVAXDyWITIlEJ3I4ogqDOLn0u4zkrbkseT5DY=;
 b=WjlkoAkOqI3iFzevwqROHMNed+Db4NMGUsBDdGxsbdS04Jj1ZI0oQwbM3QYu1Uo1k/
 Q/+bkaS2vsdH8LdnGB2T5Edhrybr5O7KbGD2dzdtGnq7Pa+FkfPZYTE8evhG1LCKPGbV
 A6i5tdhUzjOJfSuF2uHzSOQd48mATLG8mg0E6M4bkJjI974NJTd6Wv2RZbSPHmOgDLLh
 jEUBLiy6UWYkVz4PBie9EZiYmrt3xRFRoZnen0EwpOYPkazGEJk/l3PBtmxnUfUTFJ8h
 Tt2qKnFWC4H5amkHGC1E7gsbP1U2TYRZZr2zOc3Qyt53ky4FbpUCoRKrfWyT5Xzx+PfL
 dMXw==
X-Gm-Message-State: AOAM531TnP0uiT7hdMhE+Vn4EnmxD9aogIIBJsG2oFfcGFVKnFBDDpr6
 PqzSpvDWJMNkyORDY8f99QhgiskVIhNaJw==
X-Received: by 2002:a5d:4c43:: with SMTP id n3mr6349059wrt.108.1641473525434; 
 Thu, 06 Jan 2022 04:52:05 -0800 (PST)
Received: from [192.168.0.123] (bzq-79-176-64-164.red.bezeqint.net.
 [79.176.64.164])
 by smtp.gmail.com with ESMTPSA id b13sm1999528wrf.64.2022.01.06.04.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 04:52:05 -0800 (PST)
Message-ID: <50336510-0486-690b-76d1-f39a35eb1e4f@gmail.com>
Date: Thu, 6 Jan 2022 14:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: idan.horowitz@gmail.com
References: <20211231103928.1455657-1-idan.horowitz@gmail.com>
Subject: Re: [PATCH] target/arm: Add missing FEAT_TLBIOS instructions
Content-Language: en-US
From: Idan Horowitz <idan.horowitz@gmail.com>
In-Reply-To: <20211231103928.1455657-1-idan.horowitz@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLYTO=1, NICE_REPLY_A=-2.691, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: 20211231103928.1455657-1-idan.horowitz@gmail.com
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hrODJia51VqX

Ping for code review, please?

Thanks, Idan Horowitz

