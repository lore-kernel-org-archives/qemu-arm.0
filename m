Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp555238ejb;
        Mon, 13 Mar 2023 11:32:35 -0700 (PDT)
X-Google-Smtp-Source: AK7set+S9UI/+mRJZAb63dCM6vTE9XdBvT6KcfJAfQvvDu/wEgF8irola3rTGFZtUT/Z3qYWZKoa
X-Received: by 2002:a05:622a:14e:b0:3bc:ff12:e5e5 with SMTP id v14-20020a05622a014e00b003bcff12e5e5mr57170870qtw.17.1678732355790;
        Mon, 13 Mar 2023 11:32:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678732355; cv=none;
        d=google.com; s=arc-20160816;
        b=Qcmj+Iir9spYNH3IlUXkyn2nQ0Q8Fewye2dPlMQE5glffun+AA2++54qEYysfG7ZAc
         7q18v8DKGYGuap+xIkxkXW2m2DkrnZsuDYotvsrD+KKBr5eyIi7qAUOF/3DkvWnHNwnS
         f+sLEmrv/BUUnM59bBpevM6o9gWGA08Zm7VjSGLNGjyJnsvxHV1W7hpgv5nIwPODx38E
         iTKB8VmiWfRdR9ODjLhil2upS8xtHNM8zqWB5NS4EotLcGxUuf66QVHgyXyMDTsmA6I4
         Wiie2oOMjXbcNrRzT6ipw7jQhFyldqD9E52ZPat+7ocWz75lSX8YYYzgr54CM2sdV1eB
         oR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=vZ2lCdhoxWj/iJLpwwtuJdyIKt6gN/U0KcC6uwF5h0A=;
        b=VRhJL2Yp8mxdzFCO7Z2wl9cXDRF31Fk4TeG+lV9bMSWBPQD8Meazh1GPCYyxJkyr/W
         MaYrDE89LNZZWx0cvm6t70R+MBrvO+tuwZEtdh1ug/3QqEkvzTaF7GFjDDzRM3cnZqIE
         93kcecwfr6mY5jC7Xv1LFpZNwpJ/3Z9J6TQbCEC50DtVBwYD/+bbh/1Q8KRPwp5903Ns
         lr7qyQpUmrvO6f4XhXbM+2DKIItzYEEb69t62m8T/BAIuA3Tx0j9p5FnYzT61CsM2hIm
         AfuPtkPlEoiPN217yVDlg/UXg1NOe3381d89vU5TxU1+yh2TugSQzgDVXYplN5ajDHFw
         8cqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fOP0gUuc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t26-20020a05622a181a00b003b9b8c89d5asi330625qtc.161.2023.03.13.11.32.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Mar 2023 11:32:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fOP0gUuc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pbmxq-0001qi-QA; Mon, 13 Mar 2023 14:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pbmxn-0001pm-7l
 for qemu-arm@nongnu.org; Mon, 13 Mar 2023 14:32:05 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pbmxl-0007HY-Di
 for qemu-arm@nongnu.org; Mon, 13 Mar 2023 14:32:02 -0400
Received: by mail-lf1-x136.google.com with SMTP id y15so7402160lfa.7
 for <qemu-arm@nongnu.org>; Mon, 13 Mar 2023 11:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678732318;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=vZ2lCdhoxWj/iJLpwwtuJdyIKt6gN/U0KcC6uwF5h0A=;
 b=fOP0gUucLG1SOPQYpyFkm3t6x8T5XKZDPtsOIv3XlKdh6HJK0GRpDqmJ+ACiVsFCUX
 Sm0E2xPLVi2QjxIdDtxgNEKanMZ5nPlFrB1up/hnkDlFAfqmmvNF51S7iZ1egJvCNa4Z
 2e4lHyc/8oIxNnw18j20iS2f8N4dGCeL52A6Y5zEjwp2XLzl6VroVI+jNtjmSSMhafpZ
 x0xtPFZDCvQMN/m0EZUydmUc3L3cGJdJoO85uwjXnVMxYQYS1zkk9Kq+oSLgh9QJ2VqJ
 DTYUec3sia0uGuo3aJmgLqXAJaqpRDG1AJNRqzqPKyJGOEZXT6EUt30JeIaBw71WXvlc
 G4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678732318;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vZ2lCdhoxWj/iJLpwwtuJdyIKt6gN/U0KcC6uwF5h0A=;
 b=eizbwKVgwmYhqou6pum0crugKW7BFNv4lnf1nVTpOpkethQuI777U0dkS3aGjaDAOC
 bODQgPuokVIjgXNIkADfoURwwbYPjDFGwT0CEQFISLNI/vSWC4Vwr41yiazvFk9eQPoT
 KszxZ9pe1HhF3LUJxv967zZVNsz++RiygEkrAF8lkFUa7tTxN4WUJ2d716Z1p46s8i7a
 erc2JRTfbCs/0/FUbMvabjKUIByTS0debtl/njOuixWgnr2tgZYTMfm5ssTezLio5tgw
 I/aBxJo4idSL0RJQC+wP1Ff4l/g7ELsb4iraBMlysgJ6X4J1LHjEfUGCjIJzn1hUAIzZ
 71xg==
X-Gm-Message-State: AO0yUKWWtCKU+w8/n5uIBQAffapkFR17pDCVVWfIEHvL4NUsOAv/l+UQ
 Brc++RqeeMhP5WLEEHU4iAoT4Q==
X-Received: by 2002:ac2:51ad:0:b0:4ac:b7bf:697a with SMTP id
 f13-20020ac251ad000000b004acb7bf697amr3698950lfk.4.1678732318544; 
 Mon, 13 Mar 2023 11:31:58 -0700 (PDT)
Received: from [192.168.200.206] (83.11.21.111.ipv4.supernova.orange.pl.
 [83.11.21.111]) by smtp.gmail.com with ESMTPSA id
 e19-20020ac25473000000b004e83f386878sm51266lfn.153.2023.03.13.11.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 11:31:58 -0700 (PDT)
Message-ID: <a828d259-3682-958f-1bd5-cfb571554df5@linaro.org>
Date: Mon, 13 Mar 2023 19:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] target/arm: Add Neoverse-N1 registers
Content-Language: pl-PL, en-GB, en-HK
To: Chen Baozi <chenbaozi@phytium.com.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20230313033936.585669-1-chenbaozi@phytium.com.cn>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20230313033936.585669-1-chenbaozi@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 84WrQLY3TbXn

W dniu 13.03.2023 o 04:39, Chen Baozi pisze:
> Add implementation defined registers for neoverse-n1 which
> would be accessed by TF-A. Since there is no DSU in Qemu,
> CPUCFR_EL1.SCU bit is set to 1 to avoid DSU registers definition.
> 
> Signed-off-by: Chen Baozi<chenbaozi@phytium.com.cn>

Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

~ # cat /proc/cpuinfo
processor       : 0
BogoMIPS        : 125.00
Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics 
fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp ssbs
CPU implementer : 0x41
CPU architecture: 8
CPU variant     : 0x4
CPU part        : 0xd0c
CPU revision    : 1
