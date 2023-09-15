Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1505567ejb;
        Fri, 15 Sep 2023 13:43:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbhSryJc1SFEWRgQHv7Lmuz/z2KVGe0FctAdIVq3PcMPXIrR+X3/WwImAf5mRpWGWUW1Na
X-Received: by 2002:a05:620a:2802:b0:76c:6f89:fea7 with SMTP id f2-20020a05620a280200b0076c6f89fea7mr2882976qkp.23.1694810618620;
        Fri, 15 Sep 2023 13:43:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694810618; cv=none;
        d=google.com; s=arc-20160816;
        b=BcXB6xT2/WfgJmyMdCGCvw76aF0Uhc0OjLDwzFFLY+6+xkSDk9/1sExBcEAFFvrTjJ
         w8Btyu+wJH146GYlheaT+kgaEMTTz7cas3H+TY2bTZAe6HWEivGXQFdNBjrLl2T8E5D3
         zqXvElKAoabWhDpbjzcQ+Wa8p6nfe3YmPLn08KYZC8w0s00Exi4VVg6g3ok3sllgLcjj
         +F5vra+/5YR5x9nU0WP4H+f2fWRQ9FAXBr2Ynb2pYbV7CfiizD85k5wN6nGR8JyE+fvP
         cEvHaVs0ZrqChFK2uHiEn32W8egmtVT/msr7RxJU3q5f7xPPN5nyO2JzvTlhE2cGqsMk
         f3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=zc/gQrD0njymmwjojtfN9lhk+hCU88x/cyewRnzjtAM=;
        fh=/2smGNgf0wXGRGEcpa5/cXtFuEk67enjgOPOQIuEnlk=;
        b=XT3jfyWHcKlOmExA49quHCoQVIrmJBo35DMZ/Lk3R7jSxXJ77JDo+zIRnzQua0yrk9
         yXfyXI7dF6S86rXxPIOSauV0+FyfZYtukF8lol4yy/PJAasOW7V3tc97nOgvd8TJCnJu
         O9KkqYdmbSHjV/g0J6vEnJ96BUIo/Zx2qzDjrML09xID+6ZLniwasOpjvueoOKIBneJ1
         v4PSqrwA43jYxR10FuioAkr+cNbfYZtv9shK0PtSq010/eZxL3sQVOzgPalR6QJH5Jvy
         g4x2ZLDgAfT+BfA5DlsM9duJaxIvrmqSrotIi3C2nIBJCW8/tQzpyAyhPwdyPu1u7P0/
         hPfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XiE5Gxo7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o25-20020a05620a131900b007726400ee6dsi2726778qkj.491.2023.09.15.13.43.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Sep 2023 13:43:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XiE5Gxo7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qhFey-0004m4-0b; Fri, 15 Sep 2023 16:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qhFex-0004lb-CZ
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 16:43:27 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qhFev-0005YR-Po
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 16:43:27 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50079d148aeso4313995e87.3
 for <qemu-arm@nongnu.org>; Fri, 15 Sep 2023 13:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694810603; x=1695415403; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=zc/gQrD0njymmwjojtfN9lhk+hCU88x/cyewRnzjtAM=;
 b=XiE5Gxo7LV0QTdHr9QgCULCkioAd5Fqv0lLxWntMU526ZT6E5OvLbguImpgBb2K+gK
 6ZlosTSMNP8Np1qFK9fimqDVPeNXNL+GolFoYgH4Lige6+B+t6tUpr7Nsq2iHgIylX6F
 h63NNsP/Ka9+Ow6o2ykMGgJIQ6bLnwZ3Qs0+43cbH+t6eqPQZoy7KBTOErXe0lWKkCWs
 V3JDRVhsdepYEvnclHaZSdsB/8Nwx+Asu672cVvddW3HM9ookjNYtd52fV8bkTZAlOE7
 wYvLB+XADsUNHaFYahRk+gx3WsIKMDCBL2aph5unfpLmqd3RS5SOU0+L9YvvF9T+9Aqk
 LsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694810603; x=1695415403;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zc/gQrD0njymmwjojtfN9lhk+hCU88x/cyewRnzjtAM=;
 b=XWxMNKKMUFeVUtXbkNU/GUIiCTzQm9OQdvUHyJ0cFRgheiP7nQ8xZ4hMXAhT690hhS
 ibiZRqmDAp0WThioBq27zMNmXyVLvrGUmlpA0frG1vkB9Y1Kw3bRxfJQNmBtPRNafuCH
 FMu5GFz/KNKAgbAb/arivmpDVVwFSvTC+ahFPLmbmNhQIa1qwwffn5uBL8YY5W7LyXlR
 3NcTEFibOTvMmVhJ3P19piTuH9+WIMyb2E8wAD2kfKQR88Wn/6ieKRO5xUxRXo+ak8Z7
 bu+omdLTVsjBDigsSFCF6E2kVlL0Ff+cm/BfOQ/nv7+Azd3F4M52gh8hHqG+8/4xhqV3
 K9lA==
X-Gm-Message-State: AOJu0Yw9jpqsnMDX5uWrGGFQ0CFaJtZQYaKX2jPTWczWJtU95aseE+Jv
 bW89seoqB84ZxV1XQ/4U6Y5QNQ==
X-Received: by 2002:ac2:4283:0:b0:500:9bbf:da17 with SMTP id
 m3-20020ac24283000000b005009bbfda17mr2352783lfh.51.1694810602898; 
 Fri, 15 Sep 2023 13:43:22 -0700 (PDT)
Received: from [192.168.200.206] (83.21.94.247.ipv4.supernova.orange.pl.
 [83.21.94.247]) by smtp.gmail.com with ESMTPSA id
 c15-20020ac244af000000b00502c642ae8asm750773lfm.109.2023.09.15.13.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 13:43:22 -0700 (PDT)
Message-ID: <15dc1b88-49be-4ead-ac7a-74dbee7a3680@linaro.org>
Date: Fri, 15 Sep 2023 22:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] target/arm: Implement Neoverse-N2
Content-Language: pl-PL, en-GB, en-HK
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20230915185453.1871167-1-peter.maydell@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20230915185453.1871167-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 05FDcWJUMp4f

W dniu 15.09.2023 o 20:54, Peter Maydell pisze:
> This patchset implements a model of the Neoverse-N2 CPU.
> Because it's very similar to the Cortex-A710 we don't
> need to implement any new features for it; but because it
> supports 48 bit physical addresses we can use it in the
> sbsa-ref board.
> 
> Patch 1 fixes a few minor errors in the A710 definition
> that I spotted while I was cross-checking it against the
> N2 TRM to see what had changed.
> 
> Patch 2 is the new CPU model.

Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

root@sbsa-ref:~# lscpu
Architecture:           aarch64
   CPU op-mode(s):       32-bit, 64-bit
   Byte Order:           Little Endian
CPU(s):                 2
   On-line CPU(s) list:  0,1
Vendor ID:              ARM
   BIOS Vendor ID:       QEMU
   Model name:           Neoverse-N2

