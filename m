Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2963090njc;
        Tue, 5 Nov 2024 08:55:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUYiD3hBIKR+F04F5giUmEG+vxlNWGCptKHUPJ5l9CdUPKMN3ZaQhr/Vj/6WiRt1sLEqclV50XR35R3IQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHIKbALq0Za3KCZiZaL15MmcC5WkRRXYFfoSzmDlAE4sCYRWYRlnjviqoLs+KASICd/JeRs
X-Received: by 2002:a05:622a:1343:b0:460:dd38:5571 with SMTP id d75a77b69052e-462ad2c9482mr363944501cf.17.1730825729623;
        Tue, 05 Nov 2024 08:55:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730825729; cv=none;
        d=google.com; s=arc-20240605;
        b=fB+aZ9yIraRA6AcTXTmxdzRigOoQoh6Y1Mbkib7DON+vQSmN5LLj9nPqdHIANWG3vS
         Clx9dbQk2Y7HOPUWKs/qPe9uc9v8ZKxmLMlAME5iiDAw2DA6XdtCU/RGV1KYfOnArIpB
         RZHPsoPvZ8hR/xux1auW8MRKvfnQhwKjy/8KjUV7twQ99Q5W5RVY463eOcm0blD8qlRE
         rXtZG+F8WTeAs+vjDcuWG4LTVV1+D9ZXq8HH9g49prUhmsgjf0RGARYM36rnbVAWNvX8
         ANzS42yVsxBdLAfcSp6/7VPHIIhS43houlJlynwLKz6RtB8/1lJxYcPEEUYq0/ekXvN2
         Vl4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:date:dkim-signature;
        bh=o9KT9HnK2XpE6H2lyV0rXRzM4Ed3eCUdhr1THmFdYD8=;
        fh=vDt2tAnSauL46jd9IHShjTjOSYwG1bOsam4bHq/qpFQ=;
        b=b3H2bfFF8PB2dpFqSbr2zEDr+GkqrB17X+Nz5SDTydyvsc7+K7DOwYD1IyTfMLL1XV
         6E9GCWcEB2mq3BaurIoOAgU7D0Ol6xjSMKebbTQDHEl9jarxVBiQh3qOAZ1+kMUH7Fb7
         x1lZLxc+ZNPSOVRM/JuaqxrRucB4bjlUz4luKRyc6OxwKZOs/Fj94uRf75gdNm2qUODQ
         QIh+tlhPy5mgJIYLieApPOvLwygfRBWew9IhHmikAuMeDYiRBAPUvgubBQQ/QelSnUcz
         eme9jCT9Xxlcgi0E92yDs/RXXWQc/MImC/IB3+PUuhWKhNOOE+yxLR9kE/lSWODZKZrJ
         PwKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b=bLX5BZzF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad27c29esi133644521cf.708.2024.11.05.08.55.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 08:55:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b=bLX5BZzF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8Mpz-0003LW-7x; Tue, 05 Nov 2024 11:55:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1t8Mpq-0003Ip-QQ; Tue, 05 Nov 2024 11:55:19 -0500
Received: from rev.ng ([94.130.142.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1t8Mpp-000540-Ah; Tue, 05 Nov 2024 11:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
 List-Help; bh=o9KT9HnK2XpE6H2lyV0rXRzM4Ed3eCUdhr1THmFdYD8=; b=bLX5BZzFhkL9xh9
 f7fg7yqexBJJILeVurKb7SCy9ZKBi90v53/A5VSjhEYMIwo0Plp+yd5FhhBO5+RKxKFV23ZE2acQU
 nk271p2z1HOs2eB59+Ic9KzOaKZ5Xip2OQBLJxB5JEOSHVDBqB6uNkGlGCldNuW9MWmJHFLtfdYNA
 SE=;
Date: Tue, 5 Nov 2024 17:58:00 +0100
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, devel@lists.libvirt.org, 
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 09/19] hw/intc/xilinx_intc: Only expect big-endian accesses
Message-ID: <rzyrvz7j3wjphbjssy4g4ihbwlbx5qybpxye6auzz7a6fs6hlo@fkwqtleldotl>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-10-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241105130431.22564-10-philmd@linaro.org>
Received-SPF: pass client-ip=94.130.142.21; envelope-from=anjo@rev.ng;
 helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: U0AKfq+G4jaO

On 05/11/24, Philippe Mathieu-Daudé wrote:
> Per the datasheet (reference added in file header, p.9)
> 'Programming Model' -> 'Register Data Types and Organization':
> 
>     "The XPS INTC registers are read as big-endian data"
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/intc/xilinx_intc.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Anton Johansson <anjo@rev.ng>
