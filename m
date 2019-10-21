Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4868271wrm;
        Mon, 21 Oct 2019 10:30:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw00gn/5ubfPTEcE4LssT7WwfhJAvIPw+zP4o1f+t7ln4AYNgvGtDzhDMBlYBLr8qUHZWda
X-Received: by 2002:a17:906:82cf:: with SMTP id a15mr23215470ejy.279.1571679017735;
        Mon, 21 Oct 2019 10:30:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571679017; cv=none;
        d=google.com; s=arc-20160816;
        b=SpD7qHvw4PCZq1loB7o0MvqG4L5VlsGyIPZDhawJ8c5lA69CD8OQA/07e164CHQ2TW
         B4N/9fCN9gBYtvzGWlrQIXLK84lfYo0r7X9LP6kceWCACu2CBkPaNQY/h5NcnsMoTQMa
         35ls6lti4p2a5YDURtUEVEDSkuslO+bZ4dpkxtFjA2qcihusBN1Jwux7rhae2KGhVzpz
         f+gmI03byDUqw4BRPMkSd750sqbO8eqwtH2CW5XdP9YLMVAsmP2LX8OhJVmlkfDLUN8+
         9XQSD/2Yq+QdK5RNkXU+VrfBPvlZryn85g6AI62o/bGihFpegO960LA6QArhll1ghSeI
         qDRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=pLdmouST/PhRgukMUeqN5JSaJyniO0EqlY7MBTvJfG8=;
        b=RD6P4bnOtQBbkEp6v8GPHyeo1iMyKyO0fXPsNGfDdAjD+Q2tdtVq83lPyS3rD39D2z
         CHd+F9Yy+vXKgoawJegcLYYs33vFkuONtoktYDUTQKOkKZJ8FNrO5k6g2IuxVlLUfzIa
         eul6E5SXQeAq7kVJ8EBvtZkwVAv3wUa9nrReAC7KtsMZ2ZnZil9HIIqvY/yowPXD05aX
         W/WHzRNhJXCBsE944YekQNZcZNAz6W9D7eq8HIi5YbJrooi2NiuxLNIaw1eGR6Gg5J69
         TI1pRI/m021gcNWHPL98VOcpechpwnU5CrTyuZ+CgTHWdxF5yZ5txsjePcZmV0jw7Ulb
         wsJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YEZggVAm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9si8623953ejn.362.2019.10.21.10.30.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 10:30:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YEZggVAm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMbVX-0007hQ-QS
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 13:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45834)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbUO-0006gK-Un
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:29:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbUN-0005kV-R5
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:29:04 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:42239)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMbUN-0005ib-LN
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:29:03 -0400
Received: by mail-pf1-x441.google.com with SMTP id q12so8834055pff.9
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 10:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pLdmouST/PhRgukMUeqN5JSaJyniO0EqlY7MBTvJfG8=;
 b=YEZggVAm/9Q/SJBuknJOVDgF01AbVhwisTjeAr3N/Lt0YQU9pQu6S0eo4WaAa24xtf
 vNSFEt/DGzunOKdvcK6JWpRKWWZnj69eiK93arp9ng2Q07vA9tB04WoLqvOqkxqURr6X
 RtaNBO72dCPIs8cHW4l4NZOFpTZa/XMCyqiqZ5OKjr9Ad/IW/k+T2QGIYHoDhAQnkN3D
 068w8ciq4BAJoiRk2BP40X95Jzyq4vcUDoAj28h1F5dOTVLG9cNfyGZYuRkiQ9AO+joa
 9bi1naWeDeyYww1+BjLv3o8Zlb0J4QNIwa6DzXd1A/EezCKQ68fKRHa0O/PU53Q8t/o+
 F0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pLdmouST/PhRgukMUeqN5JSaJyniO0EqlY7MBTvJfG8=;
 b=j462LKho9yx18mks++KIJrIziZPQqaiUjcVqxsxpkK4hFWCzMxcWCET8qpER2kSRxr
 /ku5PnGKJe+T6T0CO2RC8zilQaJBPE0XKNLHGaiqraJvhPRZpt/t4KuKhXI0lzPStIZu
 yuoiXw4t5vkFGA7YOFxPZT8qVsqWuarD0FTlcAIbYqT/03TAy7FrmAy077MTwR04l60y
 QEG0gBfns9DsKDXxsd6LjV72RLRslKJUuIAy27VpfCprpizF+Yd9DGOMKENwiJsSUaS5
 NPU5EtwkQc2jDiUZ+Femvpgsaf+O7wZ4ZKvZ+cc4WbOQ45UAXESERIEVs3eXw54D/vNO
 8Rzw==
X-Gm-Message-State: APjAAAV6pftcd7ayvWFDLDaYad3Sg9zV/oo5PM2ejzQM2GSMOZFv91du
 bw0k+8Yhhg7qlQ4+bGO4WKpfyA==
X-Received: by 2002:a63:d50c:: with SMTP id c12mr24936087pgg.199.1571678942287; 
 Mon, 21 Oct 2019 10:29:02 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id o9sm20274824pfp.67.2019.10.21.10.29.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 10:29:01 -0700 (PDT)
Subject: Re: [PATCH 13/21] hw/cris: Let the machine be the owner of the system
 memory
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-14-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <16e35bb5-4099-bf29-0669-3529112168d6@linaro.org>
Date: Mon, 21 Oct 2019 10:28:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-14-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paul Burton <pburton@wavecomp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Rob Herring <robh@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6VHd+tqqk2ay

On 10/20/19 3:56 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/cris/axis_dev88.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
