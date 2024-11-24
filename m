Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp970288njc;
        Sun, 24 Nov 2024 15:45:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUMiP8B5pF4KIbq/HoGo5MX6uE17QUqwc7ruskrWWzdZ1ZRG2kitlx4rtMKefa8ywNPy677zY3mHgi7kw==@linaro.org
X-Google-Smtp-Source: AGHT+IF2rCWdaM+J/MDpmPkFX0gnocOOO++AiINGsF3ZQqGiy290BKMhbl3TCHnsejaTP3h17A1f
X-Received: by 2002:a17:902:f547:b0:20b:b21e:db21 with SMTP id d9443c01a7336-2129f299f98mr125754135ad.47.1732491918282;
        Sun, 24 Nov 2024 15:45:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732491918; cv=none;
        d=google.com; s=arc-20240605;
        b=Ku7VqseJmFEdvmOTSC3DxEP1oB9dCJ6iInR0XD4HhCZqmpsP2Xb2VuJKmdbedLbEmI
         R0je0wI3JnWYma7rOnxIkdZJOtZFeOpHWurfeoCIBHZhX2mI8BT50plRz4PZgaIi8QmM
         9d3fg8nib8GDj17/NqusY0LYld1KThn9ZYlDaFpxpMCreW7f0IWdOo9TjPtZLozwzZhS
         lgQmifi9c4uZ3llR8YnrJhmMJjVwylztu9dQRwhnvU6LY1hkKSELi5KVBf9SZif/K4Tr
         TB7isOwmcol6n+nCDE2mGq88kjbe8iKqDYWgH4BL9t55uRaxE78u1x9uZJgJ7hpzPIMm
         MzcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:dkim-signature;
        bh=5kZ3hJbdSRjGP3VHseVn/bxOyT1jcblJ89CvRF4QySc=;
        fh=HT4Fj1I5WEcPxmAW/Bhb+YjZZsCI2dkXndbgwKzUph0=;
        b=WnAeLGS+rnsE6Fqrx2crAPaSyOfC9GMI0C65XxQjNYPokdTDh+dQ+0R+9+agytDs0c
         UAN16v5iedbc5mXCj7dbTuUWqWvkW4+67qe3kMXo3dd/oozlYeo4ip1Ni7kvW//u5fgI
         mX/FsthCMRG2WeUCDRpMU95ltCyVdfUsnXjLP78de26M9Lo1tMzR8dlkM3wYFgdjJHCz
         I8tIuhwGja0bm8/m8mBNCynXilh0iAWylh+gkzN3enRHIRg2HBg9iC5zVy05KLqAg2pA
         ClgCvDOf8PhfYu9ZT6UIspK6FSZRbJFetJxjtlq5XO9vcR1R5gDT5/Ib4rUrSdsvSluO
         WD7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=K7SCEmZi;
       spf=pass (google.com: domain of andrew@codeconstruct.com.au designates 203.29.241.158 as permitted sender) smtp.mailfrom=andrew@codeconstruct.com.au;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <andrew@codeconstruct.com.au>
Received: from codeconstruct.com.au (pi.codeconstruct.com.au. [203.29.241.158])
        by mx.google.com with ESMTPS id d9443c01a7336-2129dc3ee09si75964885ad.66.2024.11.24.15.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 15:45:17 -0800 (PST)
Received-SPF: pass (google.com: domain of andrew@codeconstruct.com.au designates 203.29.241.158 as permitted sender) client-ip=203.29.241.158;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=K7SCEmZi;
       spf=pass (google.com: domain of andrew@codeconstruct.com.au designates 203.29.241.158 as permitted sender) smtp.mailfrom=andrew@codeconstruct.com.au;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1732491915;
	bh=5kZ3hJbdSRjGP3VHseVn/bxOyT1jcblJ89CvRF4QySc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=K7SCEmZi9DjWWsHriWlpOkv4lhwYI2WjxWw02ZsxkEEz+0cykfV0BlBajRWWC8gup
	 +Lav9L4D8OOjZgpKpePHdrIIURj6L7Pn/QyHxVHHuDFPVPJZ+o6D+4c8QJaM8ImJOQ
	 MPQOW1jlQepblT1NPLB5Xg+2atREJ6/Us77p91eh0SN7JOVFCd2vJehVWe+wCEp50Z
	 aYRcK/292+o47roc6OvHCNM2yX3vIoKPSTzAt8DNk2HiTJr6G6ei8Sj/KKMjTAA/o3
	 baQqXY5EguM7UqzwmN8cETBK31+WYdR/2Q/OnsnBqTyniEpdRIpFBb4LcNA00BFPeo
	 N1EnPCBC0abBg==
Received: from [192.168.68.112] (203-173-6-52.dyn.iinet.net.au [203.173.6.52])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0EA8E6BDDC;
	Mon, 25 Nov 2024 07:45:11 +0800 (AWST)
Message-ID: <45171109dbf17fc742176a824d63c00e07235b9e.camel@codeconstruct.com.au>
Subject: Re: [PATCH 12/12] docs/system/arm/aspeed: add missing model
 supermicrox11spi-bmc
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, alex.bennee@linaro.org, Steven Lee
 <steven_lee@aspeedtech.com>, Richard Henderson
 <richard.henderson@linaro.org>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org,  =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,  Peter
 Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>, Alistair
 Francis <alistair@alistair23.me>
Date: Mon, 25 Nov 2024 10:15:11 +1030
In-Reply-To: <20241122225049.1617774-13-pierrick.bouvier@linaro.org>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
	 <20241122225049.1617774-13-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-TUID: 1d1i+Nr0jUyb

On Fri, 2024-11-22 at 14:50 -0800, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
