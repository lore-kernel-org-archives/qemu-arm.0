Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4621113wrm;
        Mon, 21 Oct 2019 07:03:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwzzPxKWClD8H6Pb0m754FxuQVTRuAsobKioL7h7Shzc7iv434R7yQBTMIn4Z4ey2DEt26V
X-Received: by 2002:a7b:c4d4:: with SMTP id g20mr17823861wmk.123.1571666590455;
        Mon, 21 Oct 2019 07:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571666590; cv=none;
        d=google.com; s=arc-20160816;
        b=0HjyElHJNi/CJpLPVYbIv8lqVxhZ0CqcQkM/jiudRli2FqfHyS4cybKSQ3YkAV+wt3
         +/Xae/1zOgtSW2A/l2yfVxmQ1I6cOEkQXMAOt4Yl2O/BDfC4iyxFoYdzrCfgj0FhS2Op
         e7vs7HnKa6nL0a4ln7PySZyQAve2onkepC75rXr60/K+sTkgd59jQRO3U/mg5IFyEs95
         TxIiPIAkIgBUQyhepVD08u6ptUXy+l5RfV0FT+IQ18KsD8Bd+FzUpGTptB1kOf5VDnmF
         8s7xptX7VXvf+AJ+62hf1bRV+Nz+A5GYqe0Ji6noYWJN1tSBLHYaNljniOUiFwvioeqv
         421A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject;
        bh=mP5oL5g+c0P4FW0u7FHYvkZRZqB9uP9QPvUMFpNqohM=;
        b=LzACpYnhchbzo9oHVXNluWg1CYXecwtsuyl031FbETtl3FNDXsCb/RAg4M0PUPHKMB
         GVkrr+wpQKEl1YB3M7/bvZ9oNawKh1KPU00pReECebRMY36b9PUaxpS20oyjUGNyjynO
         Av/bcUYcvzhpBo/4qNLdYMjzVUX0PDJjnemkiMOTD1U/FraZVGbUpEVBdziFgxWjd4fF
         1KJLxFbNRAM0gxSh7VIJwnFb5ZYArGhA8N2kBAx3YpxYltUSkxItvdOwhcqw9yh2EgVa
         DeogNx4AegH5Hbr9bmbzr5fyOBeOP8BEOKgfAmJmEGq6Y1VVGTtcFTuK4msAC8Nf99QZ
         pOgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.133])
        by mx.google.com with ESMTPS id t125si12560378wmb.78.2019.10.21.07.03.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Oct 2019 07:03:10 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.133;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MOzCW-1ifIXY261M-00PQ4b; Mon, 21 Oct 2019 16:03:08 +0200
Subject: Re: [Qemu-devel] [PATCH v1 4/4] elf: move ELF_ARCH definition to
 elf-arch.h
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190910193408.28917-1-alex.bennee@linaro.org>
 <20190910193408.28917-5-alex.bennee@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <1b03edeb-6290-d792-5c91-b37726e18a2d@vivier.eu>
Date: Mon, 21 Oct 2019 16:03:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190910193408.28917-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zJ+nKdSdQcUCS/Gr1zXTn/4Emt3ltwAD3jDjqVxeVU03O6kPtf0
 fOCAuRHkDyZ0vlx7nXeM3qFux8+vsArKnWMQu6EWRxE8W/m0Dovg0Y+EoBdqg/dRDDT6v+r
 YAl+mu6RfDPAsNu5yIA3Gr/8n41UKpaMP1eCtJdXJJj/Rf8xKS/z2b05DT453cLQr7A8v1d
 q+JWo/KrECvVIQ0hnkTzQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:q2bovp6D+KE=:r2AyfRsO3WcbDhd0uQ8ehM
 hVaK6l2557POmIf7/QfNfMz+AaIpjKw9oDTLfC0Nd4mtnEz9Lp8PRtz9g6nLZExgNz972bgZX
 /8kD3buP7SItHRpyBIYp29/4t7DJUqYfxbNp2YnvVwME3C1GJwdDkEUp14Y+O6SyiU2GQVPwO
 m6ExttcWZPj/FG5zExMbUCvegJ/th/DlzhcRDUy/EuUSJeN+BUsGKc3LRxVX8Y1edY7atN1mm
 9Nc/lu5nXrp+1L5Blki09K4qjHDPdHabKiaUZDf7AckicdPEK3GUzlz/ORazymQK5DKhZpW/L
 z24fr/HZVJFfBDc7AXeua6tX7X3kjV/7+to650bXqQXOG0YxGU/b6C7iSq94BtkmKXmiY+Zwx
 Axq7hi8EbujtWDGWrYLc3+Q9yC4yMSgUtfOlvFKKXs83UH/w/sCDeVRFfPcIiq/MGSmlewEnm
 xezEnSIl08xKRCKLLGHiFS0RMo5o+RwessKjVdwn1++iMcvtQ/yiFWa81QHx2B8Os8PfOapP8
 KzYjAYLXxtbqwq22b0+vr+W1o/EsVLby7BuT01y5QQzNgo6EmdLSCmEHCut191aRp2q6cK9Xx
 SKRoH7PKO9AVMFWfAc2XVP2z/dAktobqjvgB2pCyKREYNU4R+0zOuNjI7lRx68/W4jXnEpf0z
 OEg/YaOiUWJV5vrkqDknsrnvoGdt/ig7RkBmENSjZJ8MU+M2zlYb7Tu7YCcR9xpoJ/cB0goH7
 NPRsWBj6ERIVt6qTNlAEJ9LDAXFo3p6xEEdS5JxvMR7zhfP3+JcFOJOrIAu9KI59yng2oqxKA
 rsd4Z7sdxuGbm6aX24u7aOlHjeQ4oc4UDHsuTn+MpOpDQA2QIUa47B+BnlAuToJ3iD+o3kwWn
 EhxbQqbLLOKmiHe3xdJjbe7NN3jvzL+KfSa21fmm8=
X-TUID: +Y7Cv1RZ73+C

Le 10/09/2019 à 21:34, Alex Bennée a écrit :
> This is preparatory for plugins which will want to report the
> architecture to plugins. Move the ELF_ARCH definition out of the
> loader and into its own header.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  bsd-user/elfload.c     |  13 +----
>  include/elf/elf-arch.h | 109 +++++++++++++++++++++++++++++++++++++++++

Your file should be split across "linux-user/$(TARGET_ABI_DIR)/elf-arch.h"

Thanks,
Laurent
