Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp242343eje;
        Tue, 13 Feb 2024 08:32:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQ69Hddnd/ptb4hbEchNoO3ag4RDEXzJNXhVXiDTh3kr//sSep6gB/557JDt7k61kUUPDiojnk8HDPKV1KfQZimFVE/njD
X-Google-Smtp-Source: AGHT+IEYgTaQB9VMOLkmHxBUqkH/Tg6zOlOmvT2doGZG82DjZScahJ6wRiS1npr2OKCTLgVKEUy2
X-Received: by 2002:a05:6808:13d2:b0:3c0:33b5:986d with SMTP id d18-20020a05680813d200b003c033b5986dmr8971467oiw.15.1707841953282;
        Tue, 13 Feb 2024 08:32:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707841953; cv=none;
        d=google.com; s=arc-20160816;
        b=BITv6nPwZU6O9ikxz7P7mKUDWCG+qMF9mQl+zv/2QoeU1M8UM+kvlycGhbZXWIINYN
         e0BnDPfeH/t2gETNvo0w0LML6ckFiKd8o3uH5D6Q6Rw1lbEBPuIM2rI1jIe5t8aC5b9g
         Zw/s5i/UKm+zmXSXhRGji4tt8E5WXzQ1cdN8Q5i+cqKkBcwdzCgJyfIpi+f49XdKFLJa
         3cJaR4tOx2c9YpIW8Fzd46hQXB+u+Av3p1qNZOKChNI+VqA7v/Vf2sRy0YdfLq8biOW/
         eO6tffD2ITGnHV2mOfRWiH/i6QSsiDNE16/D0kQuWRYlmyz3uzt1VhevsYuaOUhllG3p
         1egg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3jrflwpsNYryW7c+u3iTCPd9IBXRPClz7Eg6m1Ub3YQ=;
        fh=0B7x+XyrX6WDP3zwChVP4WFSSbXOdr76FvVn9lkYITg=;
        b=gvVGVoTIXi0IvsSk/oMYfKJOQubAUYGTtG+pIBr6PBpbLE5anHRI4IgpiRaWZPddjN
         RqKO5T/SvzDpIsV4sbMLSbgsCUqn82ie2BrNcHlFJKS6dlCS+6hMlhOkbFAGWfWFjLA2
         Q6dDf4Dvuqk51dakOFnUxxjUwra48goWo8rRWkR6Mtd2+Cy9HuVODCXNh5YaWuOQE4dO
         xpv3a2KD8or6nnrD6/93xWTTWUlLWmfi7JRMpg+4L/fPv7G1zaJPIjFVGmL2taqeGua7
         LX8Vu73SoT+6WUT+suJCLnRMyLYFrVrGlPFi3mfTX7xxhsngSgPvBudNLXgEpXDmsOj+
         SRgA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kmFlCsm/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCX4GpmAPcg53SUsj/A7JRryb4LolZ6koLMuyxonr/a/21k/sB9GPFufRP5giZiG2NaaWvfs+uZoO49ZfMNpnKsoVYx5M4NT
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp13-20020ad45f8d000000b0068efb5d3adbsi210679qvb.165.2024.02.13.08.32.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 08:32:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kmFlCsm/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rZvh8-0001mW-6w; Tue, 13 Feb 2024 11:31:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rZvh6-0001lW-2g
 for qemu-devel@nongnu.org; Tue, 13 Feb 2024 11:31:40 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rZvh4-00053D-Cq
 for qemu-devel@nongnu.org; Tue, 13 Feb 2024 11:31:39 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1d7431e702dso39287205ad.1
 for <qemu-devel@nongnu.org>; Tue, 13 Feb 2024 08:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707841895; x=1708446695; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3jrflwpsNYryW7c+u3iTCPd9IBXRPClz7Eg6m1Ub3YQ=;
 b=kmFlCsm/FYaWrT2nyIEMeN8U6mMGSPsG1H1CwDqkgxNja9aGyB2Mdo57A4EM159vmn
 mGoPmG0/KZsbI0NOj/ztvkPbj8+qEa08kxeiBXQsa+lI7WlfNV1rGQyxiGmw9rHvZRI9
 WA6je+WnRT7a+vnJaGS7n/aE9LkIvSJBwA0EcH3VCYFKthfwEqio9ZB/0C7n7QBvujrO
 pGTklSDcGGQtRuVjh2SaRd1EpQFD7fIOrKDCjShmTPfHDp6uF1oCa93161eerM2Ajd3q
 bAfTCHH6YLJ42DTf6XYok497O+SYDeCdxvyZJvj75bhaXxGCpNgTJmcDSvPMZwZyLNg5
 tKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707841895; x=1708446695;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3jrflwpsNYryW7c+u3iTCPd9IBXRPClz7Eg6m1Ub3YQ=;
 b=ZOGXy+zLwgs0aowBXY3N660gHBdeYyjYhdHeyJXYloZ1YkC/7STWtze3W/vGFgKgEs
 cetRuBcg6NgIWzItrNe9oYRkufihJg+o5CyyhCkvH4PybbsChxG5N3XFkhhfZeDJxtA5
 lYgAd08O0BShYCwUEy5ypxfOe5M5fcIN945ozduqAhDSEnFuggWeu/bJJt/zm8Tpa4hs
 BM8tpkvcgJ6dfPYw8w7UZtz+CAuIiLnuh6rtz/OoUE0SIXoxxkxFU02aFUW2uFnHSLuk
 JVDp20eirkSzukqHrZBM5HoahwozQaCprsTmYE2HAHb9GPaVh1tQZr2+Z0tmK6LKbY8a
 E1Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSnxEs+gi9XsAmCqeLbiqvT3A4PWb93RflSPDX1tuOVNJ0ACY2nU9VLUBGvI29v/b7hcRL8KRBCE/CDQ+kH4U1vfbph2c=
X-Gm-Message-State: AOJu0YwZ4MwGk48s4vkn1JjQnb6O6cbTSNK6Jc9Ft6RjiDu+Cas3hVaT
 4c45vB0RoDzmR+L5k0fp9FdFehNUtVTibeF2Avb73Tb0ADuAX/BnD8zrQkkYDNE=
X-Received: by 2002:a17:903:120f:b0:1d9:a4bb:29f2 with SMTP id
 l15-20020a170903120f00b001d9a4bb29f2mr7972plh.46.1707841894772; 
 Tue, 13 Feb 2024 08:31:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUdlUEc3atu/jY070lNE2o05DkLMARLsgUehbo1qddultCTvNBXn798gYTGkgQPF1m0Br0xVmQKZlgFBZ1WsjJOXNq38aiZ7w0bnjFndCcn9J+unnjG2tNI5HbJT+bFGpw2vPZNmHR3oeNOBeV5ElfVAEGxgN0JmXK9/mh8u3K2GvKjiMwv8XMugIB9ds49jK/ElHW6NsSwXTtuRU0FWpOmCxna0p3btfko6wnOiZ6sWui6nZXjPPP+GSG+CxI=
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 jx4-20020a170903138400b001d741873e4bsm2288247plb.95.2024.02.13.08.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 08:31:34 -0800 (PST)
Message-ID: <99f43538-8a7d-46c6-946d-0fe1cba0ec9f@linaro.org>
Date: Tue, 13 Feb 2024 06:31:28 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] hw/i386/q35: Use DEVICE() cast macro with PCIDevice
 object
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>
References: <20240213081201.78951-1-philmd@linaro.org>
 <20240213081201.78951-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240213081201.78951-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: WaxOKZKhXMbD

On 2/12/24 22:11, Philippe Mathieu-Daudé wrote:
> QDev API provides the DEVICE() macro to access the
> 'qdev' parent field of the PCIDevice structure.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i386/pc_q35.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
