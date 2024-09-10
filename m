Received: by 2002:a05:7022:6591:b0:89:eff1:5568 with SMTP id bd17csp1248089dlb;
        Tue, 10 Sep 2024 07:38:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXotReX4t/WYm7P4m0SwGJYD+4FE60VXGsyoVYLOg0I2bQukcsPmK7VN/+rf/XD0A1fF32H1v+1jxsaKw==@linaro.org
X-Google-Smtp-Source: AGHT+IG3JiXjJnPwUlZ54Teic6ymey1UyaC8gkT+qI5oNqY2AwKvFL/D7HtoUPBC4CBmFI7XPJcB
X-Received: by 2002:a05:622a:390:b0:458:34ee:3a62 with SMTP id d75a77b69052e-45834ee3bb4mr83139251cf.7.1725979081987;
        Tue, 10 Sep 2024 07:38:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725979081; cv=none;
        d=google.com; s=arc-20240605;
        b=E5vt/bRf4Sxc5BhaRN0dRbAp1JnhkISuHSpH2OHc5ztPyxZRZumkmJj9Mi9N8OIorn
         NfPij/81j/JOVPjkR34o1GOK43j+UxuvDMFn9tDkMOvVRPsv6JJQywcYcSwTFsIZYHkI
         t45UNP1tYUztsg6kEBf840Wwk0Uwj7pIMjFEMCkxe+Ql0DYVa2hzNcolVJj+JzxodlxX
         xHjx/g//MVlFbBF/askALik7Vp+auGRoYXFgi1T2jT4wyaXk4Z5gUCs1zP1Wro08t8g1
         jD/sUPmbtqdnqvhAKpX/DDLMOsC/nu3oVWLB2KQyBcIhoQzZxNZnRmuyR0b2ZlTS/cLD
         MugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=WHNDNhx0ko4aE9mmdBQTF2QSMKeZiaVeCZriv3zVQUs=;
        fh=6kRp3K1jVRJe/0go9qIIcZsa+Wj5WXzmWLQ1QEnOntI=;
        b=IqGZI/nbr1i5uD0zfQcMEvF4TACPeVHkvnlI0spkFgfHliSruF3AdfNJOODO/zpONy
         UlPsehyQU8CuyiLSOFmzoZDn0w+MvxVvsWmQCmZ624jLKrSx4u+NVpJFYKUwXHti4W5t
         mIDdeCUZ0R2z/FiabT6FtEzrc343C/OELnONNoLP3sJAaDItgiFaDG1+CqMVOX/a4Tdu
         z4XyZKfiCjI4z+bZAaLmYgztfMKDe+eArSmPmi0S7sSefbhbr0INLmDshAzudrW8Gkbw
         YzbDN4hgRYcrIoufOXsoRWL9IKsbRcs+tDHzmTedwt7xZx8QTDbknqLpBP0VweoyOBxl
         IMnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eyo33Nkn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822faf7a9si79684341cf.568.2024.09.10.07.38.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2024 07:38:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eyo33Nkn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1so20B-0002LD-Pm; Tue, 10 Sep 2024 10:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1so207-00023D-IQ
 for qemu-arm@nongnu.org; Tue, 10 Sep 2024 10:37:51 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1so200-0001tD-Mb
 for qemu-arm@nongnu.org; Tue, 10 Sep 2024 10:37:50 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so25721266b.0
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2024 07:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725979063; x=1726583863; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WHNDNhx0ko4aE9mmdBQTF2QSMKeZiaVeCZriv3zVQUs=;
 b=eyo33NknFH43sSQ1JkLkgnF5o01wbk4SSFyTNK4HvBwXuOOocHJonJ94EJYVyFryse
 nxNiPaRWY4NlwtA+FeyK5FQE4z30DpwBmvEC9e9lVdM3klf6I2PrXgBzcp9Ec159Flmx
 nEqTMEOPOS3vvH1jvSoizXWq2F+HPBJP1vRxj+lGAMmPoIQsejGHPnr2x3eBcomf3Ven
 zlxVIbi+G5QO52W/58m4iuHIoGLY2uCfI0UPsTJMFHkZGRpl3ikZxlW6As1qJP8Kau+3
 G0h+ykmcXLKVWVEhipsnyOwIwsZ6tfN8Uj65V2McloTHzhnikYKbHWuuK5tFsRDFh826
 eg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725979063; x=1726583863;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WHNDNhx0ko4aE9mmdBQTF2QSMKeZiaVeCZriv3zVQUs=;
 b=NXkxstx+YHQXwUIsSw9FRfPe1Fh/wS8cGb/JHvrBMuVTON/XhuHogy/itYsyVbCnPo
 Hkxs5GEo6zI2XV11Msti4MuZiKlIvE27pus/lHvOUSDTA+3q1S94JOEb0BpUvxG+lYPX
 OBE80SIC4dHHS03MaR058f2l3CcPPS8L9ugui5WzFQoeNNIuTqMXclzBjJzS0uHhRbz2
 ZMbOuy2ndFCdp4zMRDRdcCGoVuGUPzbV9qPyQll74PpICt2fGcrFE33YlZjZko3m8y8Z
 dL8ppcrWWdn9eh4aaX/V6X/+2UYJaREdfR9RWUHCNi2feEYMA1096VodjyBjJWkOuBFX
 J/Cg==
X-Gm-Message-State: AOJu0Yw2NwXzM+YslYBrLPM9qiqtreunWjS15APFbG/MhevS/Vvtc4Ej
 OaR2ah3M1BmtMWxXGy6YbtIbiUTqVJZfmyMYBifL8AvwmLutxzFmm7vAYUOysvg=
X-Received: by 2002:a17:906:f58e:b0:a8d:29b7:ece3 with SMTP id
 a640c23a62f3a-a8ffb2dfb12mr137982066b.33.1725979063264; 
 Tue, 10 Sep 2024 07:37:43 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.217.32])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cea3eesm492236466b.145.2024.09.10.07.37.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:37:42 -0700 (PDT)
Message-ID: <b8e13ef7-9c3d-412f-92f2-8725073de779@linaro.org>
Date: Tue, 10 Sep 2024 16:37:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/29] target/arm: Fix whitespace near gen_srshr64_i64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20240909162240.647173-1-richard.henderson@linaro.org>
 <20240909162240.647173-16-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240909162240.647173-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
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
X-TUID: lllCe8PTNk1+

On 9/9/24 18:22, Richard Henderson wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/gengvec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

(https://lore.kernel.org/qemu-devel/d86b4c48-dcb0-4651-92c4-8117f9f50543@linaro.org/)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


