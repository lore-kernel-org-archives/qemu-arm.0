Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3504511lfq;
        Tue, 15 Dec 2020 05:37:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7mP2JGURa1rzpw1RVv2VrsumFnFyhhYul4KNGkVAchsCwroGuZbuIm5kIsuWEiPqWwiLQ
X-Received: by 2002:a25:34cf:: with SMTP id b198mr43586085yba.283.1608039458958;
        Tue, 15 Dec 2020 05:37:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608039458; cv=none;
        d=google.com; s=arc-20160816;
        b=MP67uD7nWJBUSOat0mRmNRkpWc9G5zLyhVAMezPoCvKYc0N/NVPZIxaT/pHFpBlgDM
         OW16Xxz98zEdc4SIpAbfkjjfvZg3xAZ8ek97JKpmM+i4F/n5oENXuO3EK1ADyIs4qCds
         qwfpHaBA9APneD3adYza4Qxyb0QKg0f76Nou4DjpLP8R5UDCy6J/iF+EuGGsebVrJ6W4
         vs/4zEfMKanpYZnZXbw8H3c0WmH/qKj8IYDxw2G/Rf4ExlOmcJX+J+O78OdLtv3f62ZI
         u37iRIz1Xc/tHDRtGnoMqHKqHxzoJjJBAszXsHlmH5YVkqGlowtOx9FW6BXYpZ54keqB
         mE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ZD1lk/HdeUfig3u19uZtakYcAZnjy5AfMijIuvr9g7M=;
        b=VKbp6H/nms2k22hMg3iq/X3pbveJEMmYDb1LnWNH6px1cFvNc694vuUigqzYKxdOwB
         uJiJ2DX/bGqFkhpOozFAHF5bh7yn1E4zYc2W1wIshVWRmyslEd3Kz61Mbm+pwPEW5mtd
         f32KbaRly0W2fZIinJ3RfH83axtP4B/INyMlrHG40iy3w+x/1ExpngMV1vk5oSMx2Jjg
         a8XlEytnEyWrLiy6T2/7c8GEYviFtSImm7dMIamixo8j/PiFooxHmkQo55VuyA64YTNr
         ZvcfsytgvpSypdYTP/YVOKi0mpC71ct/fwE2G3Kw4kiNlTeGIj/MQDxhrUmomXd2tc2z
         UJ8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NVnDxyIP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t17si17403048ybg.314.2020.12.15.05.37.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 05:37:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NVnDxyIP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpAWI-00043G-Cg
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 08:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpAW9-00041f-IY
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 08:37:29 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:37521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpAW7-0003ew-4w
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 08:37:29 -0500
Received: by mail-ej1-x644.google.com with SMTP id ga15so27705914ejb.4
 for <qemu-arm@nongnu.org>; Tue, 15 Dec 2020 05:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZD1lk/HdeUfig3u19uZtakYcAZnjy5AfMijIuvr9g7M=;
 b=NVnDxyIPttUd74kdKMjQWTQ1ZFmR9CxTN9jlAodn1w9Wr5WQjjMYshq+hPJpztgwGQ
 ZLZ6kVAWq6443qPwWwraAcWC+T5l1CVzMR+u+F5t33ayCEIoeSyBW1lJuHbiz4iEvx6K
 uDjVQuQj4fuOy/fI7V2JHa3HhiYvbd6H7vwFeAyPSpOZFArLlaQXY2oa6wUKvconPrBB
 mKEmY22OLhchZitaPT7bwcJOC6BW9MqS/5oluKQPSMc2LSI3mwzS72BmJ34fAjGi0cZo
 FBw3pWXOeIinKJ2UoxdiNav+Pv31SSCJizteBeKbLxD+d4fIhF5/nAaqTkDDFXLOg2SM
 EEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZD1lk/HdeUfig3u19uZtakYcAZnjy5AfMijIuvr9g7M=;
 b=ZwIUOQGDzZcd0im2T5o/EmyeRfRWBiiqy2csiwo6qB9MarYt0Xt+QWp/kZ1cYNe8hX
 vYRw3NCRdDHzGbsuY6Tr8u3VkhuZonKL9MJfdaE5FUPVl8pCZklslSkUl0B4P4QR096m
 twPR/0HVc8ZJ8JGmpQ0LBBfW5w3O+S24TnkzfGbcErZJE9l79RED2EHKh7tZLtDE63XG
 /YOQm68Qb/qoUh+JynQ2GtY82ewuwLwk5iSq541Lmdmos7H7NsVqPFnKnTLWH+ELjjZy
 gYlEM8x7iukV9a53fTlMATEeaxOi+dwkI5Y2CXTRiM/pg5JyqZM2H13ro73Y+JGzk/9O
 TxEQ==
X-Gm-Message-State: AOAM533eUQZpSFabPgz4eIYUAA1WFrog/jeT1oJYHC9el5/03imR2BnQ
 QutOE277uezenSwB/kfT7/mjb11SYBgFTjBYA/OWBw==
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr26310070ejd.382.1608039445514; 
 Tue, 15 Dec 2020 05:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20201210141610.884600-1-f4bug@amsat.org>
In-Reply-To: <20201210141610.884600-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 13:37:14 +0000
Message-ID: <CAFEAcA_zcbw-8G0dOiRAAv-bsPV_M3_E-x3mtcLgkvDjYEEfSQ@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/misc/zynq_slcr: Avoid #DIV/0! error
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Gaoning Pan <gaoning.pgn@antgroup.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Gaoning Pan <pgn@zju.edu.cn>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c4rUa/ak3Ssw

On Thu, 10 Dec 2020 at 14:16, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Malicious user can set the feedback divisor for the PLLs
> to zero, triggering a floating-point exception (SIGFPE).
>
> As the datasheet [*] is not clear how hardware behaves
> when these bits are zeroes, use the maximum divisor
> possible (128) to avoid the software FPE.
>
> [*] Zynq-7000 TRM, UG585 (v1.12.2)
>     B.28 System Level Control Registers (slcr)
>     -> "Register (slcr) ARM_PLL_CTRL"
>     25.10.4 PLLs
>     -> "Software-Controlled PLL Update"
>
> Fixes: 38867cb7ec9 ("hw/misc/zynq_slcr: add clock generation for uarts")
> Reported-by: Gaoning Pan <pgn@zju.edu.cn>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>



Applied to target-arm.next, thanks.

-- PMM
