Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3545270ejm;
        Tue, 25 Apr 2023 07:41:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350YGcflrCn87smk4puLZnwf5hhYz3qWhyCmP/1S/Gfl9yPNdCLb9uq8I78yeo0aClVuB5vSZ
X-Received: by 2002:ac8:5812:0:b0:3dc:7fcc:31c7 with SMTP id g18-20020ac85812000000b003dc7fcc31c7mr31064266qtg.2.1682433703972;
        Tue, 25 Apr 2023 07:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682433703; cv=none;
        d=google.com; s=arc-20160816;
        b=aO8LP3nGiXaPT5ajynAdc4782bwX68Ylg/UWQK0qhndlsimGlaw80x35jJhB6HUKz8
         mBXJG6dz99Ex5RvH9A52zoTSM9k/57DWdsk4yvpE+xklA9EDwTf0FqoOvLosZLb8Wf3S
         FliaHOD18JuDhZ9lIEioSL8ba3NCGBUVsTp8P6XIlAhmdkuz+Au+0nBUnkLjIXiLE5oz
         iPa2ceiLroM1TAwOrqZkDv1exAckNA4tJmLPw7+ChfcqZag8PisreVzA3f9fnp4TsJ1s
         c5DKvV91WJnN6ACp1rLR/S7rRVLaBNRVscjHwRN6EnVs+fXIj1ASynHz4Ns+TveWS30l
         9oug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EhxqKnVC9K2XzjU+N8GzrUzeVSMhs3WmZYLQaANdl/w=;
        b=UtSdjFZSxEsbt+9fDdIHfhU2l79KpvbecTE5iFSrOyRYNlhZQch71TOo5LXWBCRsHf
         gWLh8ozsHDfBAH45x3FyY5k7k5RrwwVOP0qd+qaM2sTjTGU7SHqjcigpz7x1LKPXhQu+
         TO4oziIWh+7vBywc/W5PBXPu+CRBITOvQNyLwIfrh3YPab92UAhdaWEurIKqH0XY6dfK
         qZq1VJkDEoxSGWvSLiuH/Ob63M+BemUFo9sZZLrczeNlfCFhCsu4sZQwLankCAJRKuiB
         Q6U4I6D1rHCB8Myc4A4lG3C45jP3fn+tLBasya6JheOjh5/F8C+eo1nsH88RKUa35Vkj
         Z1sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=drsgBbOC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15-20020a05620a240f00b0074df9f1f2aasi9319506qkn.690.2023.04.25.07.41.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 07:41:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=drsgBbOC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prJqk-0004QV-F5; Tue, 25 Apr 2023 10:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prJqi-0004On-Js
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 10:40:56 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prJqg-00007V-5y
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 10:40:56 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso38485575e9.3
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682433652; x=1685025652;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EhxqKnVC9K2XzjU+N8GzrUzeVSMhs3WmZYLQaANdl/w=;
 b=drsgBbOCUDEb3EpC43r1JqOADOsKrmlQYh/rj4hVPnSqwRUT+l3A7AjqntvfgJj75Y
 mSHSFCllfD4RAC5wbGQXCJb1+6ODY16Y9BLFPL4/novNcqDo6DtlMCwVtAYzlPlq/VZ4
 1j7bC6L7KsbcmuSK1K0f8+QF4hCS1dzJjYqgKK7nKXmECtPPDxuoV8FIvdFpYRqeY0jt
 53vQB9Fr6mvbVNDCGgxtDA1cFfLAyaCymTb2dHhp6q2Fxst9lxY0W7ktfOXZ5MBjbIoZ
 ykSwHyvfzIi3Detmnalz3WllwEJxtD9F2zjaexxlYwdrgvLDOZwaBZirb4hqDf0PaqPG
 /cuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682433652; x=1685025652;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EhxqKnVC9K2XzjU+N8GzrUzeVSMhs3WmZYLQaANdl/w=;
 b=bQJt+BQOiP4uE8MADpG6EHQ6MIF4FpSbjvEd16zZp4zz12vfkLHZVnB5bwuSG9HCBk
 IcvLJsrKk3Ow9nFD1BY2jf489c4DanWsR6GWrKCVKBHRnncg1iMzroKsoMOyBlJfDpb+
 XCP+UR0doGmm4jfJJY4NFsccxZ0PWO6wFSgfth0zlLheEtjlqJGzyXZBCm1DEf26C7Yd
 q3yeMkgf/oarT/ZauuJS1Io7fDbcm/RJRB+5YFLwOjCvK0E93MoMFL7IqZlpLaNAKhAw
 IUUjVinP6MtAlhozaN0aVEccH89zdzO0kp4RQKlyRKNNMbYQuK1LWgbgD1jnB1SWq8Gq
 XJ5A==
X-Gm-Message-State: AAQBX9e5BRzp0cvmshDIRi4lbaUfl+lPvxy0CVCVeca0KVGukQmGFvZW
 AhohDUd86j6ZfP2m3IhJeXavRoosgn1RKwEc9RmzTzPs
X-Received: by 2002:a05:600c:24cd:b0:3f1:6ef6:c9d0 with SMTP id
 13-20020a05600c24cd00b003f16ef6c9d0mr9514711wmu.17.1682433652545; 
 Tue, 25 Apr 2023 07:40:52 -0700 (PDT)
Received: from [172.27.248.56] ([212.187.182.164])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f191c9c4b0sm12051997wmc.11.2023.04.25.07.40.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 07:40:52 -0700 (PDT)
Message-ID: <4986ffc9-a350-f828-78ef-b2f54f9e01f9@linaro.org>
Date: Tue, 25 Apr 2023 15:40:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 30/57] tcg/s390x: Introduce HostAddress
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-31-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: YQaiLTGRcWXT

On 24/4/23 07:40, Richard Henderson wrote:
> Collect the 3 potential parts of the host address into a struct.
> Reorg tcg_out_qemu_{ld,st}_direct to use it.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/s390x/tcg-target.c.inc | 109 ++++++++++++++++++++-----------------
>   1 file changed, 60 insertions(+), 49 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

