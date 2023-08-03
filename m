Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1311703ejb;
        Thu, 3 Aug 2023 14:12:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGVuRC8BtW1BoB1MFbYjkP/tZzHSs5JYn/Q00D60O0MjiUfHL0Z+ZJ/7tepLIfDCFqB/5La
X-Received: by 2002:a05:620a:2551:b0:765:8063:c369 with SMTP id s17-20020a05620a255100b007658063c369mr23909334qko.74.1691097154453;
        Thu, 03 Aug 2023 14:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691097154; cv=none;
        d=google.com; s=arc-20160816;
        b=UrpmW8gNiUAtoiVEiVY3MXGB/2FBSXNw3RL+VEg+D5/6YfABQoWnGInPSXahZL7FCz
         m/d58wuWgxR4YyOraHOS2iD0BOAf0Gw0bezFY8uJReICPd154NGhZnKB4GphX/eHG6kr
         eqOsUdcd46OY4gU0N/gJ5Jxgo+I3G8ropY1m+Tw2Z/mG8Nf+8IYfCnuxV9Xpe6EoprT1
         byU8MN+ibfVSrmfXd46ZxadZY2fn2FbEBbSh/74qwPOTXDEUER4lW63m17IcvsOaebSO
         rka95C7GrLwu6VFvsjvBnO/mIVswFRh7KZUrqtSi+vdmiVbvqsDeGvxQf/oomarCj9Io
         WArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=As+ERIUrD0IaW7ogbeDfd68h0VQGRppMM3xAQTCouVU=;
        fh=Mo/FSr/dYR6mRzc2+GLXW1gk8fQQcHWpb9q3PcmwMAg=;
        b=YcvSn3e91qrwIwgMknWfs0aI2IepTN68h5ucP+rQY8aZyV7VRPh0u6Tm/UcaTkioYz
         5xCWHdnkuPVk1fjWKgAC76HCouCcFOrI42reo3bZyFnONJJwCHIKLaV0qdCB19/Ju0+b
         rfPMBJuJVbWDo9iZuntkumoyIWDtY2amxmsBNAJ7TAghVJQzysSPxmYBbkfxbvjJAs7C
         fcHDKa1hN3/q7Vu84GTzZsmrUGgspID0Pjm3Vf9nODnwYkmLCvLkEjXwz8yhbHyMuxt/
         q9aObuWoGysspkcgWjGGleBADkAGTThB0s9XI4Anm+PxcHR5f61F1sxDAUzbecd8gS31
         fNpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=owLgXUvT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12-20020ac85ccc000000b0040fc0291b77si357327qta.237.2023.08.03.14.12.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Aug 2023 14:12:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=owLgXUvT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRfcM-00021J-PA; Thu, 03 Aug 2023 17:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qRfcM-00020y-Bd
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 17:12:22 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qRfcK-0005Ry-QZ
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 17:12:22 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-686b9920362so1003650b3a.1
 for <qemu-arm@nongnu.org>; Thu, 03 Aug 2023 14:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691097139; x=1691701939;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=As+ERIUrD0IaW7ogbeDfd68h0VQGRppMM3xAQTCouVU=;
 b=owLgXUvT851bfNzas+GMjl2Psxw96fTc5Nh5tRiFS+jCI2JlixdKyjLx0SOE9R4eRH
 LmHHnSn7HbFLa6C1JzqkUP2xj7Q5nJkV+VgwWnw26wt/VmVT5NLP+z08mGFIiiJyI+9W
 fr41+Gao5VqvxAUAgqXqHaDhJC5y4O83832jnnxlt7MtRjXwXkzk5OecaQANn4yH+eQW
 5PGT7j2TQp7SzdFhKZJu00V6l1o1D2W2b6FOLTbtNFPTJOBrw7tIgqSou892aFDHBn/T
 LGOFW84VkdCtYTIe3AErXEBxv6i5/aSYMByZCVdgGlttvp1B76aBmVLcg1g1p0WP9FPW
 x97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691097139; x=1691701939;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=As+ERIUrD0IaW7ogbeDfd68h0VQGRppMM3xAQTCouVU=;
 b=PKf8xiwiGDI+jWsTw0CqgKXyYsbKmevOA+nPISpIK4LWDPd6ruEAU+T/PWHMsq060P
 QLdA89NIM8SRlhxqKr4ALU9DZ8fIjCSUwpXQthCpJjVoksWEG8WGI2AYYj34kqTwAs9c
 hJNUSpLJahjFG4UAsPpbQEZqhSUCCNU6bYg9EDAZf6nm42ITxbFHyiZW72kXw0jEaYfI
 0nIAIn3ETRjLf+iOV6RH7+gg2/JzkwYVXF4FsLO6VMr8v+Bn4vcbOr6Cbn7G2wsOs/bS
 Oe14zaB5K9LRzCWj6CTtObaIH1UdMGNIybpC1KmNJhnOGrdVvoHIECdoTNFSdaip+90y
 6liQ==
X-Gm-Message-State: AOJu0Yy1jaHYAQCRr12aufyiQB9eejNiUmQzihv4Re4WmtBtcmf+ljfP
 Za5Cwldj78m3+gcU0vh9Lo1h9A==
X-Received: by 2002:a17:902:a50e:b0:1bc:4adb:ed with SMTP id
 s14-20020a170902a50e00b001bc4adb00edmr704158plq.38.1691097139470; 
 Thu, 03 Aug 2023 14:12:19 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.144.105])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a170902d48d00b001b801044466sm296724plg.114.2023.08.03.14.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Aug 2023 14:12:19 -0700 (PDT)
Message-ID: <5621a3cb-21a9-a830-4117-3e65b589384c@linaro.org>
Date: Thu, 3 Aug 2023 14:12:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/3] linux-user: Emulate /proc/cpuinfo for Alpha
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Michael Cree <mcree@orcon.net.nz>
References: <20230803204803.639733-1-deller@gmx.de>
 <20230803204803.639733-4-deller@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230803204803.639733-4-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: QxXvCdbGIL1/

On 8/3/23 13:48, Helge Deller wrote:
> +    dprintf(fd, "cpu active mask\t\t: %016llx\n", (unsigned long long) cpu_mask);

PRIx64 better than using long long.


r~
