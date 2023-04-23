Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2395409ejm;
        Sun, 23 Apr 2023 12:02:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZvB2er+HfPmJA+VgXLlMJ1pWkuYiiA00ISPhVFzLMhMxYViTfQQ7Q1v3up71JN0n1KlomP
X-Received: by 2002:a05:6214:501b:b0:5ef:6b9a:6948 with SMTP id jo27-20020a056214501b00b005ef6b9a6948mr22734157qvb.17.1682276555103;
        Sun, 23 Apr 2023 12:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682276555; cv=none;
        d=google.com; s=arc-20160816;
        b=VtA9bnRDxF0PqGsxOkU1uuQR8OVAPVByzKCrOZOhv9juO2pzdLJ3wKfuCbBUnkrSk2
         2CcZB7bu0PdT2rdMG4elxRkTMnax6mA5r/lV3yXv+ROMrCvdn90bQ53EC4AR67WtFHja
         CelXCVMOBIF2AohBS7Q1MD6CB9VP+YZJIbNE5huSXbn/MXdLNngFD+nLedrL5RGOt5p1
         b9+PIXUjXFbHUs7vpEzq3phCybxNwodaWU2f1rNhgVClvpZMc54Cv6JO4ydW51Y17lTL
         rdWZjYNldlJbxKu/buORA9WsJQsIpRrJT/JOiqBDK22e4Sd4gsNTVwYUCg8ETIAD68P6
         TTeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YhuxIZ5v5vQjaZrSWGTo/f9QQ4mFP5ML307cPL2FIEk=;
        b=cXbUMuV5Y0TNKbDyR9CxPbCXuoZLjzo0Ir01XhoXXfb442IMsJjvRaRD2BtGesWXch
         J4IHnL8tz/xoiiqynGQmBBoP9QET+E3F/R7Qcq6pq+1iEpJteCYPTd5bmvKHJUveAtNw
         S2C0SVTsbLLhbS1OeJKtoZCy8sg9qXVeFSNBZmdri7iqjKNLeT5fAr0Mj3XWIKphaQOd
         obwaZbK70TduyGg4PY8iT2eQKHlhVEKxGDsCPpkaqt1BZAkeBxTl61szWa+qzliHVSpV
         5V8oHQXWEiiBS/a453A90kegsFuYSJEMjQQpxZdn7QSMCyns4cGNwMR+sdEFR9OCtz+8
         To+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ntx4jM99;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eo2-20020ad45942000000b005ef78009016si6084364qvb.261.2023.04.23.12.02.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 12:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ntx4jM99;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqexB-0000Et-LV; Sun, 23 Apr 2023 15:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex2-0008Vb-J2
 for qemu-arm@nongnu.org; Sun, 23 Apr 2023 15:00:44 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex0-0004Qp-32
 for qemu-arm@nongnu.org; Sun, 23 Apr 2023 15:00:44 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2eed43bfa4bso3304716f8f.2
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 12:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682276437; x=1684868437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YhuxIZ5v5vQjaZrSWGTo/f9QQ4mFP5ML307cPL2FIEk=;
 b=Ntx4jM99/Q9ONKMBmHdhFE5ygF+oAKqV3517Oca+osndxlYFDD5O5sTbO86P9BZ+9U
 PwW2fexBGdy8Upataf0wb2FDaQK9L5hhyjU64HDsxKFnqai7+sdsawNZwzfxYpnDrY0C
 CZpW7QfnG2VE0DHR350HmmFSbVRrVXwYq2yDwKT0NOPTCPVJzYHPesLryNwRQ6ML7p4H
 fxBflApFTYaTDLx6bRb/YqhVLt3aiiyu6tg0//eSPs0vyxasbhnN9YHONL9V/za6AYYu
 Jab0d9gG9moheQbZ2+HU96cn0kO/vU4rKiLCwvx0vxWLUMoj9Zq/Wmxm1uyRlTfB3Cf/
 t8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682276437; x=1684868437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YhuxIZ5v5vQjaZrSWGTo/f9QQ4mFP5ML307cPL2FIEk=;
 b=JRyMZ9NUsOQGxToxaYTU6VVLzpv5GOMHOt+Ba4ynU8FL67Is0al9ulzPXCA+Fkvlzp
 t1sjs+72Ylxe6m3GIyZIHI+CjsqqiukcIKXQzZAiGBAyzdTijxjCzTMGcjQsXxIwW2/D
 12GonffeCYl4b9A2ilazKo5n++SRSPzqKRFBz5Oa91B/ZVgp55oPxI6xXdZa20gh8PAG
 92PdmQ1hp6HZ5P3X7SiY0tldx3F19ZVKkvIv/PwAxaFNe5ajlLbm9/7hcFZX/SUg5uFJ
 /taX6xr2u9nZqav+NmQ7v6dVRPVhoqXTg/uEXMjNOBzSX76MrsQ3fUifv2/Vyn/gSmXe
 +Vnw==
X-Gm-Message-State: AAQBX9eOx9obIQR8OZniTiPlHV42jqPtCvkj9OB7HTVZTXaW8BoGWXiM
 MAvEoiXBtaVq0EagbkclS5Ll+Q==
X-Received: by 2002:adf:fe02:0:b0:2f4:de63:a0b4 with SMTP id
 n2-20020adffe02000000b002f4de63a0b4mr7956320wrr.64.1682276436949; 
 Sun, 23 Apr 2023 12:00:36 -0700 (PDT)
Received: from [192.168.109.175] (119.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.119]) by smtp.gmail.com with ESMTPSA id
 s3-20020a5d6a83000000b002fe13ec49fasm9113641wru.98.2023.04.23.12.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:00:36 -0700 (PDT)
Message-ID: <0538aac6-8510-6ed5-c5f0-627b90a09bd7@linaro.org>
Date: Sun, 23 Apr 2023 20:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 25/54] tcg/ppc: Rationalize args to tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
X-TUID: E/QxU71ZQZ2e

On 11/4/23 03:04, Richard Henderson wrote:
> Interpret the variable argument placement in the caller.
> Mark the argument register const, because they must be passed to
> add_qemu_ldst_label unmodified.  This requires a bit of local
> variable renaming, because addrlo was being modified.
> 
> Pass data_type instead of is64 -- there are several places where
> we already convert back from bool to type.  Clean things up by
> using type throughout.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/ppc/tcg-target.c.inc | 164 +++++++++++++++++++++------------------
>   1 file changed, 89 insertions(+), 75 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

