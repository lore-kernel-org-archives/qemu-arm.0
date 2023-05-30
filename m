Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2217699ejb;
        Tue, 30 May 2023 07:29:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6giFPt6PHcSAzaOF1nR1wSyf30rMZImjYxR0xwNOqly1EDTPa21xjbdohFlWoGNloLsYMc
X-Received: by 2002:a05:620a:20c9:b0:75b:23a1:3685 with SMTP id f9-20020a05620a20c900b0075b23a13685mr1788909qka.70.1685456973625;
        Tue, 30 May 2023 07:29:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685456973; cv=none;
        d=google.com; s=arc-20160816;
        b=QJcysQkshmSP552Hvg9tNIsk3WIMAfKJCSyyQF9JOTZO08D6yvlVQaQX72R8ZqwUp+
         G4+KhAM5NlfRVvCU7KEW+bRdnSiUfn+wmeCZ6iiKDNYC7ikC0pB1mqkkZC9+Db2V5Kag
         GqVlHcfW22hTuZiW7EzzI4Cnyn7COAf2fo90Ml2BbND96s1Aoy3unezYC6Myv20vY7bo
         v6T8RvrianTzUMN0GidnH/D0WtiEITSg6X3C5YCqER12NqvyJzKDfEWCLd/+L2zU0FKn
         qsIVEDUvLmak+qUqLn3dMq8F7Vgg5obiVUaUAjMlpRooKi6LvtHtJEiipIuBGzCnfttM
         BLhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DdtmqeRraGPK3DxuXErqTENFASQDjvBjGRM7w5znKUU=;
        b=S5S4+y1ePOy66llLzidiUt3lxf0/FEbSohS73LH9be3GRGmrRuXXZzye9cQrWzR1pK
         tdw1WdDZDq4LXz52peQlau64pX4Y3PUuGwlQCVXMTukJU+MYS/ZkV00qHESkfZEZ2Jz3
         Me6gVUKHCv04504Lli1I5z3f65jcN0NeQ2VgTUHE3bi+VB28Eolual1Pjf1iPGa+I6/c
         vMLB9nFlojp0A2JjUXEI3LJXE5drp6uLlzC4WrRrewKaqTzRVYrNoU2K/tfHIAzx5n14
         Xhe8/qGCZSfYhKq0MxZEyJAAMbuRa+Kd8nY/Y92iyHPj8VLfcBfPMPF3VgIeayXY7WiG
         UKfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tV/xTYw0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22-20020a05620a069600b00757903685c1si6347625qkh.417.2023.05.30.07.29.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 07:29:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tV/xTYw0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q40Ll-0000pz-Dj; Tue, 30 May 2023 10:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q40Ld-0000mm-OP
 for qemu-arm@nongnu.org; Tue, 30 May 2023 10:29:17 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q40La-0002WE-NY
 for qemu-arm@nongnu.org; Tue, 30 May 2023 10:29:17 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-64d30ab1f89so3035432b3a.3
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 07:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685456953; x=1688048953;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DdtmqeRraGPK3DxuXErqTENFASQDjvBjGRM7w5znKUU=;
 b=tV/xTYw08ws1oRArenJtof2MjsP66/YhbWPB3jfjPCP+Fa9tYUV2GxDR1KvFq2jyJi
 XgBruDx/wIDt8CmBeodDGfT+ChkhlvTd/2A9q/1YhKRdvKWbcTCiskPHqcqUtBjNBghj
 RSib0N2VGQ8SQ9Nx3KSPwdoAHNk8r2EgMMRbOOpkOR7pWjsoY+BEJJ03vaewl9vLVbam
 8IgfXMkVVETW4ffpIR6KZiVMhRW11NfL2+JR2HO7/8JlCTevGPweC66Z130cb+Fi/oGz
 ZyqIVnGy/rI/CoaaIK98r/R0QqLH8SCmpQd5NdC+iIoJyFjjngCGvIQh4RlzGJ0MveVM
 cZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685456953; x=1688048953;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DdtmqeRraGPK3DxuXErqTENFASQDjvBjGRM7w5znKUU=;
 b=ecEXHdGjTFN+b6X3Nj0Dh8AeVtOfJFKkoB395lPKTxjKDjtqutbBgw/8BxwWVe8WDW
 92XPjlXXs1dM0ELZFW6ULdbjC7wsGOs7xqJ767m6j14Pp683MuGFTY3bVGVQPf3MrWyv
 ntL+ROHLNVxugZPMEmY06pdSJNkBLYh2Zo62UPYX9xpXVTy2nQMew4gPhKtkl6HyCayG
 ncE7MPdvOYsQrOMmCE1DRFMhgAHV2KYyTvteHdFNdJ85Sy5LuTuETeZTqyj5gyjDCnyX
 i4ZdT3D96+PdG/CBaf0deNDHes0ANVO1AgxG/ewhyWruQcFUD0Mcq8sNp8PpqYiKzylX
 nGYg==
X-Gm-Message-State: AC+VfDw3ZZKFX0tylasBGp+csjq15kOD4S/8jB8rVN2URhxB3PEJbRo8
 u0lqsVgeEcpyjV0iLlOLlYQQVw==
X-Received: by 2002:a05:6a20:1610:b0:10b:8698:2097 with SMTP id
 l16-20020a056a20161000b0010b86982097mr3246771pzj.0.1685456953038; 
 Tue, 30 May 2023 07:29:13 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:35a2:c45d:7485:f488?
 ([2602:ae:1598:4c01:35a2:c45d:7485:f488])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a63f711000000b0050f93a3586fsm8854683pgh.37.2023.05.30.07.29.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 07:29:12 -0700 (PDT)
Message-ID: <a7ba5e1c-ca59-b114-229a-07930f6ba683@linaro.org>
Date: Tue, 30 May 2023 07:29:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 02/16] accel/tcg: Fix check for page writeability in
 load_atomic16_or_exit
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
 <20230526002334.1760495-3-richard.henderson@linaro.org>
 <CAFEAcA8E_wbiL=xxc=qzfbhBjTsGVxpMGYex_Ezsn_=47DJP3w@mail.gmail.com>
 <5192c74b-38fb-7f2e-7b27-58d210c1b087@linaro.org>
 <CAFEAcA8tPuFMz8BZ5P-SJS42q8E_TZ1_5DJL-0kOvzeT-Fymmw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8tPuFMz8BZ5P-SJS42q8E_TZ1_5DJL-0kOvzeT-Fymmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: C2htrXOleX/M

On 5/30/23 07:06, Peter Maydell wrote:
>> This is about falling through to the cmpxchg below: if !PAGE_WRITE_ORG, then the page is
>> really not writable, we will SIGSEGV, and handle_sigsegv_accerr_write will kill the process.
> 
> Right, but if !PAGE_WRITE_ORG then that implies also !PAGE_WRITE,
> so we do that even without this change ?

But !PAGE_WRITE does not imply !PAGE_WRITE_ORG.
This fails tests/tcg/multiarch/munmap-pthread.c.


r~
