Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp425828ocs;
        Wed, 28 Sep 2022 09:49:56 -0700 (PDT)
X-Received: by 2002:a63:9d06:0:b0:43a:5cf5:1204 with SMTP id i6-20020a639d06000000b0043a5cf51204mr29684698pgd.557.1664383796779;
        Wed, 28 Sep 2022 09:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664383796; cv=none;
        d=google.com; s=arc-20160816;
        b=d4AaD6Vr/qIPwT8H1pSrnbrFBdeeApZNYNOfqIzYOPQfT0jN9mbMjXN9xPT8ASyZmq
         awI+NcaU0TkWSHsVKjkAWOaRz9Zaa+K8V7BA4c8GuH/XMeyWKHUVaudTtk945w0sjF0P
         UuqqU1y06YTS2Qwsx1kESib+UzI2GF+LPojOPy+LH8dcDAXX+shnkieW6/tpCzq2aDT4
         bNkkgi9oMwibHVPkAU928Ne3lPMKkjBKzoaWUbGbI9mFmlY9LERh3jtXoNzwYjeljNez
         v+fYov0j8vSFiPDl7hPLLmFIO0eNu1DXno+oEw2/qksUUTXxk+rjae7Kgnfcx4X4xdOj
         x7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1IKxUFSNGwoHqldMuM/VV8u5bnK1GBzBpKzhno/gxDc=;
        b=OMqhJ0su+ZSdjneMUMQyF4+RuO+O+8VnlKMV+TfEwQCT895gGnfFwpubWO+C79BQN7
         SriqoF0HVgkR9gxR8aD/9l8+uomtzNcgjV5fF0zTU8ndbQchdvxmffSZ/sSm4CJgY37d
         SAQ5pfpYT7xmV3vsiFx5WQqP0YHpCYNSYuv30M+KaaUg/Humctvfb4C1ufosCC2GO8PZ
         rJSYSl915/Qdz1N4/3/tdy+lTpjzkCTBdKFPAG8NRrujPBzizVuTpZIDJo6krs/diN0M
         cZiCNuXBnxQ1w5X5YC67MM70m41YCBgp0BbmduLIosQOkkMy7jldRY9+dC4PCKsA4OBr
         342Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VwkX2QDF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g9-20020a1709026b4900b00176a3e124a3sor2423511plt.28.2022.09.28.09.49.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Sep 2022 09:49:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VwkX2QDF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=1IKxUFSNGwoHqldMuM/VV8u5bnK1GBzBpKzhno/gxDc=;
        b=VwkX2QDF2fcPkBjR8c7JzIsSE3xgGMWLyWrV2sthj9RF9UJ7JwDlTt9Ji39uZABrOh
         cO3icN5brfa8WxRMitTmeYWlV1cM3EEfjXnXtweF6bBiOIMUZcLfKl3Cb5DPFzE9NhrT
         XUg5S5JMhQzIzeQ43sHc8sftCZgL4aJST8LTclpwOj8tua2YrsBO8gTAmQj7diy2GLd+
         tP4zwwGGVQYpKsuyzlJycn/w/cima+Wyi9VcmR/lxiKIr2HukZ/K04RFvvFJUvGqBCqD
         HEQQiiEm97IGTxbdhsuob7QtDrcxgHs3urEzMjJtiEXGbSxY6k67qkaPdxzv93uQUbDS
         wkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=1IKxUFSNGwoHqldMuM/VV8u5bnK1GBzBpKzhno/gxDc=;
        b=ZgX7mOTjyqI34qYk1lizo+HKJ7V0cw5ivIuubrDFE2azAZFXZxBDHMuaW6vBwXvz7d
         N5wy8f859E2weEwivH/ND+V0ksqNFbBRWUxerts2R35y7a27Fb8ks3lWIIk98vsxlsQd
         ZWKOqnoVUGKXvaEEG8ZXh82KH50ZFQpp8STmP3HL7ZSDmV8Xw4PpQEnbNkRsaZgDwZfe
         Cz6VNOhAWHu5HsOd0nT8ejVOeDBqwrOqFc+S0yfT8lPIGWlETW+NDMczf6uz4bX1rzM6
         xe8NbL9hdciScuQK56aBgOJBDta6viaF6NXd+ujqoQg8Pt2mSWPpo70Me28oTbgulYZz
         7LGA==
X-Gm-Message-State: ACrzQf23FXuhzzcV89i681MyWURk4cFWq3Q53RvCpui68Df2hmQF5/ou
	04PAV+grPGGx5XLPa6lMS0tBwBGOKRRicDIh
X-Google-Smtp-Source: AMsMyM5YtuxXU5wQl7XxYYlu3Og1sw6rGDOx5wOUbC10CN/TflfwVT8jKwT5rQDamh4FdtRlgG4Bng==
X-Received: by 2002:a17:903:247:b0:179:b5e1:54b7 with SMTP id j7-20020a170903024700b00179b5e154b7mr728324plh.84.1664383796387;
        Wed, 28 Sep 2022 09:49:56 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057? ([2602:47:d49d:ec01:986f:cb56:6709:4057])
        by smtp.gmail.com with ESMTPSA id m1-20020a17090a34c100b00205f4db8120sm1618576pjf.4.2022.09.28.09.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 09:49:55 -0700 (PDT)
Message-ID: <eb65b452-828b-0875-586a-e7ea5595092c@linaro.org>
Date: Wed, 28 Sep 2022 09:49:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 04/15] target/arm: ensure KVM traps set appropriate
 MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927141504.3886314-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 5UTTdsw2kHdt

On 9/27/22 07:14, Alex Bennée wrote:
> Although most KVM users will use the in-kernel GIC emulation it is
> perfectly possible not to. In this case we need to ensure the
> MemTxAttrs are correctly populated so the GIC can divine the source
> CPU of the operation.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> ---
> v3
>    - new for v3
> ---
>   target/arm/kvm.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
