Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1076526njb;
        Tue, 18 Feb 2025 17:37:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWukT3WN5WiImTTJ0Mn4lceWor2inLZX8mDNOEF10Yeakp9ZZSWnXGau6VHMu2lK+8JX1KiSR76gW2PzQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFo+R3y9OLx6o76RiYVZWY1uvIlCRTTl4LiRvHNDnH6vfkfh9MADvfLdXxBr9WwwCX/Y0S9
X-Received: by 2002:ac8:5893:0:b0:467:45b7:c495 with SMTP id d75a77b69052e-471dbd19d7bmr213443071cf.15.1739929021014;
        Tue, 18 Feb 2025 17:37:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739929021; cv=none;
        d=google.com; s=arc-20240605;
        b=ixeYsP5uRIpTfOhGXHsngenTzIWOWkT6RrQTMVoadsitwpca9Hlfb+Htm0ERt+HahK
         zc/M2T9Ycea66gq882xELpKm8SklRNnVhAzuYSWplizwKKkO4+n4Nr2zG6lhVxJ7fa6s
         U6hxpdb/55Ru/ek6NlpdLjAEp0KkbT0Oaw+885/3/4hoF6aKjiol0omFaDidunrAr2El
         3DYRV7SIPumkhLVhkg+cX5JqNGEPk4ExquVj5tYpRB62UaghMsB4PCkDFTc3zb4WqCtr
         xrKhbLpsdm8FOvf52ekAOgrZB20wHTBnrvQrSQCaqxEJpADEDq/FZ7RSpd0DZxz9dDRv
         qJBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=F63M/1e+eywrzPbVcgGK45bzslpIH0ylXeM+M4jaei0=;
        fh=C8f3JfqsWYANrl8R5RGclljFmfXAbGP6qncSob0qNKk=;
        b=L9Wb7ayvFYDJdOypFkBYWpJY4CONfWr1du1vS1MkfRkpNkUXUcKxcERUdDpdej2g5V
         KKxHvi8myCwQCnrZjNiHifwcK/9VSQzoI18PyqxJ/fRtD9Y6tKKctnpAH2eMJXoEaUs4
         6CHky5Q/UqaQWCxF/uaMU60mEIdKCWHxPhcXG2U1yMoWpd8o0EUdOJhW/sQplBc2HUu+
         3dCo/jzUm9rprWwKc8zImeoYl7n7eMXX3Iop5oV4EoirIWFrX2zOHQyYx30t4RxUQHXu
         fS1ItFmua9kNddnAHgEV978dDlDtbP6GYTfLTVZ5GtoyIXFdcQJjf8/ySahkVngS2P4K
         blnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=O7CvckeR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471f092819bsi52274481cf.595.2025.02.18.17.37.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 17:37:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=O7CvckeR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkZ0h-0000qC-Dx; Tue, 18 Feb 2025 20:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tkZ0e-0000pL-06; Tue, 18 Feb 2025 20:36:20 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tkZ0Z-0000l1-S0; Tue, 18 Feb 2025 20:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1739928963;
 bh=F63M/1e+eywrzPbVcgGK45bzslpIH0ylXeM+M4jaei0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=O7CvckeRmEnzBPIT9eExLgwyKXhayFMaj1H43otklqoMD1gmkaUCQkmJWKfsWX/od
 fAOD+F3lFW9KiMZCg0uFsUYBZ9pcfTYLpm3h2KHEZHph0ceOdH1SNGUyKKWVraQ6oN
 /lZK1srivKTtUtO9wPBN+wSgy87mZPpXTc2+31Ic3+CpiDBxGAeXmVUvTr46zSDY47
 VVPcAowv43u9K0LkvK4FgWyfo+rMfuK5BwJckLovoMWGNR0frYWu7rJkp/TRN3ajYh
 RQrN1KwWFV7+crLmBAdPdecysH3rqwaSoHl/Ou+FlvQbHVi6vXGgWUD94Jn91A5Iyz
 q//fc+J1hPkzQ==
Received: from [192.168.68.112] (203-173-1-6.dyn.iinet.net.au [203.173.1.6])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8C96276191;
 Wed, 19 Feb 2025 09:36:02 +0800 (AWST)
Message-ID: <090dbd8f11acbd3c166c62e3b0b7acdd1d6cb347.camel@codeconstruct.com.au>
Subject: Re: [PATCH] aspeed: Remove duplicate typename in AspeedSoCClass
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Feb 2025 12:06:01 +1030
In-Reply-To: <20250218073534.585066-1-clg@redhat.com>
References: <20250218073534.585066-1-clg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nuEfbGLCprtz

On Tue, 2025-02-18 at 08:35 +0100, C=C3=A9dric Le Goater wrote:
> The SoC type name is stored under AspeedSoCClass which is
> redundant. Use object_get_typename() instead where needed.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
