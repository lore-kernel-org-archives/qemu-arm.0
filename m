Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1347562ejc;
        Fri, 3 Mar 2023 09:37:01 -0800 (PST)
X-Google-Smtp-Source: AK7set+R88wa2WHU2brA/SIeFFl0KmRllVAEdiNStsStjF/lNkbWRVaD9tsGhbPjbO99x4Hg1YNr
X-Received: by 2002:adf:f750:0:b0:2c5:5938:e6d6 with SMTP id z16-20020adff750000000b002c55938e6d6mr1760505wrp.35.1677865021305;
        Fri, 03 Mar 2023 09:37:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677865021; cv=none;
        d=google.com; s=arc-20160816;
        b=l2Ss2JoTNdtwqHhxYPhNB6u7cKyPScR27t9Gqez0SHni+v4VDa8ZazhUymHb57V+7e
         p5uIoDq74fdDs+fOIVxxYqs0iyXp1zXiBJjGE68daV/fVaLRtXwXniWp7JG6+q+PDaYA
         m7XD9XvGWInpKwM5WMtXqKRJUi8SgVDkAtuNPg73DMttnJkcOTF1EjMRyfUss8tqDHeI
         3edhNGx7NtPSr6lno2r0yekNpUeCW7OfLkIsz8vQ/8U6a0lvlR6GxebL3OsW+xx0TiEh
         iFuqkztkDux300fx3MrygoIP5UZB9BgoHYCj5oJOQX+4pYzTX4BaexlUiA6LfZkBFhKD
         G8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GQ6a3NDdKNcX9UM5wDiIzLHvAyafoQztXwgMXUDzcyE=;
        b=Tl5bVlIIy5tAc5BHS4Y+xEYB3psO9DMEHcs8ZJJO3mIjUz+wEeyLsBNbUYj7RokDK+
         K09ihn+yyCX2aK2u8Kn8jpPCVM0G6FF21ykeIzjLXajRrVtHuD34fIGN8GGJR8UmYwx4
         lyHclu45unnQBdmhNoo3a6DxwUawCz5XjKWIthN1SfBiFzdNIMLbYGjeIwvDyI2jh4mJ
         pMJNTKPsuKWZWvVAyY/0hFhkRX1WRpkj853mFoa7mmsoS/HkzCaOTX/pYbjhXN76nwoh
         ca/YPDrScWco6sYN6mNRlF6op9VyoC/XTxA6d/p+Phe515CdaRmJf9TrASy94gwsyoE3
         lh7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NWcy53Cz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15-20020adfde8f000000b002c5a7237632si1935303wrl.1057.2023.03.03.09.37.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 09:37:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NWcy53Cz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY9Kg-0003Lp-4V; Fri, 03 Mar 2023 12:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9Ke-0003Kd-NS
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:36:36 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9Kc-0001aM-Ln
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:36:35 -0500
Received: by mail-pl1-x635.google.com with SMTP id v11so3451637plz.8
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 09:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864994;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GQ6a3NDdKNcX9UM5wDiIzLHvAyafoQztXwgMXUDzcyE=;
 b=NWcy53CzX7Zp88K5c4Dv0eEp1hbsyeTy5lCRzZ8v2x8o860UXHgQkLulal/+3oUXpx
 klo8QhzJ23bxxyqU4e305vIgP9wg/Et99UuPtxolE1NhEcXR9Xa1oL2IG9vcLHY9Woiw
 ehFLN3cmcGNpF2qFOKIi19XZV+/9ANDQgf3Ndw+Pfxm4htXIRpwrwG6ryn8Y3hj/Ke6t
 nRjrNXdRbmiqVRK8gUHDMpmqFfUSilPdLVo59+rj+9hdpeUa1lY5MP8xT+Kb5ZejSF4V
 cCgeLEgHIBwobH4JVD3LT9GkOwsXgqvW5FbgICYCOXnO98wakWEEYSS3ITaRtPrRdKLq
 28Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864994;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GQ6a3NDdKNcX9UM5wDiIzLHvAyafoQztXwgMXUDzcyE=;
 b=D3DHsgNSESgX0D7DhvxZ/3/3OID3lE0V+kf9YA7yWdZPG5eOcODGYVpJdP9PFR1aCu
 /cjD6PO/ZDb1bxz5Rnc5CoEQN1y5c6Vr5WteWRH3oq0BSr+LnPVxbTmI/lbmUoeWfdXl
 wWmVGGND1FnyTeKV00eR2vtVEKBzUQ83KwnaZOLGniz3RShX3GDiM737wlq5hJlHg3Wx
 wcgFxCN94BFWJmkDsm84lJ6xQGS/NgjSuAMAJOJUd7U7SBTzr5AA6L4RYV/dARyxGDxW
 +D6JwRNxysaoJ9qmeKmRXo/3SO3mnyr/QPv56TV/9svNU/LFwW9lFSanY4j6M9Djs8+i
 uhlA==
X-Gm-Message-State: AO0yUKUqdVFzdkmfZOUv2da4EOQJTX1JPYoVl2+mHp1oQ0iySczv79W5
 yNHKCXEcFNa1IxM6yAPfexneEQ2KHREXGAkpG7wNTw==
X-Received: by 2002:a17:902:a3c6:b0:19b:8cbb:30fe with SMTP id
 q6-20020a170902a3c600b0019b8cbb30femr986145plb.13.1677864993986; Fri, 03 Mar
 2023 09:36:33 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-12-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:36:22 +0000
Message-ID: <CAFEAcA_P6N5TBLH=ZB=kL=HDnG+yuLa9op=yOBWAZnVdQe7KJg@mail.gmail.com>
Subject: Re: [PATCH v2 11/76] target/arm: Drop tcg_temp_free from
 translator-m-nocp.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x635.google.com
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
X-TUID: y71Q0HJlnF/m

On Mon, 27 Feb 2023 at 05:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-m-nocp.c | 20 --------------------
>  1 file changed, 20 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
