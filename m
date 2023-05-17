Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp945874ejq;
        Wed, 17 May 2023 02:06:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7I5d83e9O/H6LMj+6PyJcIUccaZDKCJszG8B2Gmuf1XJMLFNPoAlvs2W3kUlmk1G8tPQsC
X-Received: by 2002:ad4:5ecf:0:b0:5ef:4233:ee7a with SMTP id jm15-20020ad45ecf000000b005ef4233ee7amr64822403qvb.2.1684314396094;
        Wed, 17 May 2023 02:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684314396; cv=none;
        d=google.com; s=arc-20160816;
        b=xfw5Aa0Tf0WfgD6rYLzC05GqXiSygLZRiOWpXXuy+1vH/Vz48UfOGK29CczydWnUmk
         OXF6W+LAbbrTEVAwUK0VUgIka9bBW52f0GdJp8CDfcGKmsc7CWcrKYzTfzZRGD2p5hNA
         NJmpEWXM43YJOjE/J1piDxzhsxm9FvVEa4SG8an/bbrQ3oC0J6KmqUO8vdQ8C7LbtbJ5
         H00p3SbTIefje30H34y5+hwGghB3oOwT9qgPCrGVq5S/EzdMXHMdZm5FK8PIyt4/oi7D
         lE5d1D7TV7Dk9NpNZy/nT31ctlGMqk9M6y5mZuBvyasN+Kgqg1ZRkehkPafxifs7OENX
         uo0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=hzzhUu6NqXhYwAMhgp72/3S4BHobstJjZ3S9dtyR02U=;
        b=cIV1pxcs/fEr54fNOHfzpvbMzhzXRXgM0/nMfeT+xHw9dRqUIm+28WvIO24ozq5tyH
         yXoHz9iCW9K/9qfYh1FJsfb6pfYaAvvPqQKhB5Z3X6E8YFX/XetDgNpnpFUVjDM61kzx
         KhIPHfdLa2U+yzDZscI7F0tx13ih1OBe+qfi7+tLufNQkmJAjz+o34c9+9T6kExD9PZI
         XKsIg/0wBCjMQwuPZTqPva28ui5qsOwd2wUN8M0UhTbDfuJherm0OhgMPf80tJA8NayN
         IqcnHtlyay6oa+SvG03jcj7WzZylOkuWBzV+ms1A23Rflj+dviOFzjqkX/RdBDGJegDl
         /JrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gefh7voe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jl10-20020ad45e8a000000b0062126972463si13174987qvb.417.2023.05.17.02.06.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 May 2023 02:06:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gefh7voe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pzD6o-0007Bh-Jz; Wed, 17 May 2023 05:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pzD6n-0007BR-6i
 for qemu-arm@nongnu.org; Wed, 17 May 2023 05:06:09 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pzD6k-0005Dg-8V
 for qemu-arm@nongnu.org; Wed, 17 May 2023 05:06:08 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-306f2b42a86so288818f8f.3
 for <qemu-arm@nongnu.org>; Wed, 17 May 2023 02:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684314364; x=1686906364;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hzzhUu6NqXhYwAMhgp72/3S4BHobstJjZ3S9dtyR02U=;
 b=Gefh7voe1sJKpFJinwFGm2QGHuj0q13Vm0WdTR7d0xpk8EBshVh8rbkdkQD43nKcvG
 qaQBkmZ6kOqOSH0xnGGq4opMoTWnPPKAEqf1g8Vo4yi8FqinRH0A/sSaI2hIT5H4HnX/
 QDGG9Ye74zcDvuH5ydC0it8O5bDco8WvidOYhy8jJ3vEgRqQ8LG8SZ+tNQSy6P8Ol4Dv
 cgWED9g12CK7Eb4g/LtQcSpTjhUNqgL4AlTNa2vBrSOa/tMYlceUMc/FyXfxAIjYH6eg
 Euv1+f65zFnPb00yr6hGpTxNq0JFsWyh73Tg151OFfRWL9G82XiSYYmCq9ZK//n0nk+Y
 3+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684314364; x=1686906364;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hzzhUu6NqXhYwAMhgp72/3S4BHobstJjZ3S9dtyR02U=;
 b=YPFwhXmQPETUWU5l9UYtIE6VsFZH0MprWSXX4oIxyd7D81P4bp4INH+7ypqHoJBJK0
 R1D/69YXqgSrRTKcKO40CstcugxnnWWlkEeEwZmfVH2p1uxnI1y+WmO3LIYzEa6hOWKZ
 XdMPBd/DR08CiLnB2YMlko0vTpvq6skq1++M/Lj91Esjd2OZhgQdUCjMY0qYAmPfUGgu
 F2zlrS+ZRk/+1cEE1H8/72m6WLoKj+bup7zRySSCBRf0GuMmXndkCP50OJzDW1DL/3Pr
 945ou2YHNwkxe+Y0IU40vUM3qj0Ed4v+N6Q1bog+6uLgqq7QDv1jiyGDSwehYSejt9Rd
 rVHQ==
X-Gm-Message-State: AC+VfDykGaTIAt6BDLWKSEyBCuzvf+oeopYog3CCUgUsDauCgi8fsmV5
 sX3DW7eMcVOOuZvuvfRO9r+3XA==
X-Received: by 2002:a5d:6ac4:0:b0:309:42f3:4c3a with SMTP id
 u4-20020a5d6ac4000000b0030942f34c3amr93181wrw.32.1684314363783; 
 Wed, 17 May 2023 02:06:03 -0700 (PDT)
Received: from myrica (5750a5b3.skybroadband.com. [87.80.165.179])
 by smtp.gmail.com with ESMTPSA id
 u16-20020adff890000000b00307bbbecd29sm2126674wrp.62.2023.05.17.02.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 02:06:03 -0700 (PDT)
Date: Wed, 17 May 2023 10:06:06 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [PATCH v4 00/10] Add stage-2 translation for SMMUv3
Message-ID: <20230517090606.GB1415802@myrica>
References: <20230516203327.2051088-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516203327.2051088-1-smostafa@google.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: bvJqAf+xQT/0

On Tue, May 16, 2023 at 08:33:07PM +0000, Mostafa Saleh wrote:
> This patch series can be used to run Linux pKVM SMMUv3 patches (currently on the list)
> which controls stage-2 (from EL2) while providing a paravirtualized
> interface the host(EL1)
> https://lore.kernel.org/kvmarm/20230201125328.2186498-1-jean-philippe@linaro.org/

I've been using these patches for pKVM, and also tested the normal stage-2
flow with Linux and VFIO

Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

