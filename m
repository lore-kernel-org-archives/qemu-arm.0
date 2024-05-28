Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp23352ejk;
        Tue, 28 May 2024 08:18:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXiQ7YggpMAyJbIzfPrNHxt0Xe/cjNHN3PkP+Us7nDWI0IpjRWpK/VpQfvSrtEFAJigDLXXYrWPm8DRyLwsDkaVqo8mKwPc
X-Google-Smtp-Source: AGHT+IGGPNBR/i55tfuIj8kUODUb7aTtN4+IGmo5r56Z0xNiLBqZvy452dal3ReVgQl+IEjU+0Eq
X-Received: by 2002:a05:6808:3b8:b0:3c8:47a3:3cb5 with SMTP id 5614622812f47-3d1a5b3ce71mr13001805b6e.24.1716909508293;
        Tue, 28 May 2024 08:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716909508; cv=none;
        d=google.com; s=arc-20160816;
        b=Mll5bW9MDN1psvtXMIu5gAQywzOwpGG+3PWqK7Z61Zls48aDcfOF78vY0vloJXVhyn
         OyoDJSgGJASgjKnN7kzi0zcDz3R8sHaAb0pRCDG4h3Fi+GpDYFXFgd4AV2H/sjPON3DT
         vc5SwZ+Bpu98oKBOmlZmFbh2Bd/ypWhdyFwSH8+GAOSABps4xY+VV0DhFe326a9S9cYj
         fX+dmiTJr0gzviOw9x5m+Alx3zuTa8mL0E1KMTzFs+6c5W0IYVq9kJzlTyVQhbHqPoxT
         sPDoEnoIRx3iYDwsvpuYMdRUhjGMn+XF1/3SVj5+vB4lE+IkW0JdcnG4VuNx5MRCskAX
         4dgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3GPidNkvE7hjDr8Tb2VFal5rZ4pUkGWbicQZrjprVTE=;
        fh=ljsml8VEJ8b5iHyffylCyaj8GlT5e5X2xEVQKXIf6ko=;
        b=wBLmy1AiUFkk3cdqyrS38WjoiIUW4tLiYBuUJTY/3c4eE3NyaRPmRV36szsmXXzv1l
         o6mbvwrWOPWU7UWWrfU+sxeIg/B9xZz3KZ3DgeZTHsXtmNpQQ7E567yAtdupU7wdpHKr
         UXHLu6VMWoIzsuFlbDKc+0urPBvlrww4D0yuzxdjQe8z8CQvynTlyWJZGQsJ5lD+Y9mS
         BP1xCxGmlnWgnWlmOSg5IXNHhPp2F/amGFav3p4ctj9uvjjT5hIznRiGaMCeF32EKAOb
         iK8jgWYpKixqtwNgBf0PPUpgfSAgT5quUS1Wk6zaA/aHlVvgv8Cp3RYrYtjC+DRgvio6
         +Z8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BKXgmAqq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fd97d63fcsi18103881cf.708.2024.05.28.08.18.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 08:18:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BKXgmAqq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sByaY-0006C1-U7; Tue, 28 May 2024 11:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sByaV-0006Ab-U5
 for qemu-devel@nongnu.org; Tue, 28 May 2024 11:18:07 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sByaQ-0001OD-Jo
 for qemu-devel@nongnu.org; Tue, 28 May 2024 11:18:06 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-354ba5663c9so777348f8f.0
 for <qemu-devel@nongnu.org>; Tue, 28 May 2024 08:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716909479; x=1717514279; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3GPidNkvE7hjDr8Tb2VFal5rZ4pUkGWbicQZrjprVTE=;
 b=BKXgmAqqxbMhSz1fYRiLaIImEBCtz9/JMERYLISlavkfw/zFGtft5IvZM9F+cuJfeb
 JrmnFIeBcf40yfwj7ij8Ihk41I+JNSj3s6oAj//dcPNWGecMWQUKmy+mNoTbmH3MIXbT
 7vp0Aa82ob+SdFIvsOul6KIVGNhtRkWSPdpLgi9lqGM4zHz+2/kNydA8IuWxzCxbOYks
 WWIiOG4kbGkbQLYe1AIvNiys1GoiLVth4IBJi874K41x8LfJE2tsk3t8oTUwBv57Ncwr
 I60U8XGCSwhlgofuJuSR+7hAlGa3mIJp6XTLAvJbTxtt+1l1bNM4C4gWgClfCSjFWDnA
 jZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716909479; x=1717514279;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3GPidNkvE7hjDr8Tb2VFal5rZ4pUkGWbicQZrjprVTE=;
 b=KvdSp/8P/uxXSDPFh2IWTeUHgg2PoSIiM/aYGjGSYuj9lPzrk0cQnth85AlUDYW/6G
 nhquqBYOLEl2s5+tS1VpSedDq5uQO/vvPraFPTK2JHHA8BlkviuwQG0HcNDiDF5gCdFV
 gquSRoZRT2su1OtLimqFGJnxR9IuGD8IERlJ8knumPVP0QCNAcJlSu61NvRaHXrILK/1
 yrPtEEZd6fD1OJrgUugr2uLFNu4GaD5HnZyvT5wGe5kpggAPjRhjrFjQUWKY0i+icMY1
 kdh6I2XQ4C9QzlI/eY3lfFUySyZ+jNcxzybIwhjfmZF6G2Wcr53VqOeO9dYOvn+NY1jb
 VZ6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+q83jOUuQ4OBi/wNx6brEIvxnQjsmARLI88FnsMPrhajpkKr/9XeD2ds+eLdZR6UruHCa05qLW1QSTLfEi5YBMrSAjgw=
X-Gm-Message-State: AOJu0YzuzYpwLG8aIev7K/LFSywgOm8Nkx4dwCA59arqnnkYVhbRMizj
 xdMrID/HBjbp27paw2ndH9KMEg0/efvqOFCMBHWlb7cx4x3EGqXzhOp+sJbm1Pw=
X-Received: by 2002:a5d:4f8e:0:b0:354:c329:90d3 with SMTP id
 ffacd0b85a97d-3552fddfa23mr8992819f8f.49.1716909479169; 
 Tue, 28 May 2024 08:17:59 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.214.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557dcefdd7sm12282561f8f.91.2024.05.28.08.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 08:17:58 -0700 (PDT)
Message-ID: <4d964d18-db2b-4282-b499-ca42ec8b6112@linaro.org>
Date: Tue, 28 May 2024 17:17:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] hw/clock: Expose 'qtest-clock-period' QOM property
 for QTests
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Damien Hedde
 <damien.hedde@dahe.fr>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc@lmichel.fr>, Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Thomas Huth <thuth@redhat.com>
References: <20240523194441.21036-1-ines.varhol@telecom-paris.fr>
 <20240523194441.21036-4-ines.varhol@telecom-paris.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240523194441.21036-4-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9xRiTT7qbHAz

On 23/5/24 21:41, Inès Varhol wrote:
> Expose the clock period via the QOM 'qtest-clock-period' property so it
> can be used in QTests. This property is only accessible in QTests (not
> via HMP).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Addressing Luc and Peter comments, you can replace that line by:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks!

> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   docs/devel/clocks.rst |  3 +++
>   hw/core/clock.c       | 16 ++++++++++++++++
>   2 files changed, 19 insertions(+)

