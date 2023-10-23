Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1704066ejb;
        Mon, 23 Oct 2023 16:45:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0dXAJtunutjXau0F77DWYpbzFuwR5N3mFfVNvzVPyqoCC4s/uVceUHF7sqUWpJiVoLkxZ
X-Received: by 2002:a05:620a:63c3:b0:778:8c0f:b9b4 with SMTP id pw3-20020a05620a63c300b007788c0fb9b4mr8621100qkn.28.1698104745002;
        Mon, 23 Oct 2023 16:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698104744; cv=none;
        d=google.com; s=arc-20160816;
        b=kaPEeadPJz9DjF9qXPAYH5GEaTpkmTBdbxR4S8r8SHPVkIjg9YBfgColCBeKUCS1Mh
         HDKROS8joLYutDuk6mFR53NDEhWz/twpsIbXgFYUslX6weRc3X+Rc5nc6zcoUFB9nbG9
         YF1dsk5jRf9sVEOLNcvIBg2R1+JHGUR0D/fbIB8D6YhnVwpBCRUtbKasHES3cE6UMyKG
         0UhaHLSt7aZMEcxcXwGuXxBZl67Vlep9gA/Wcny43xVqUd7KMafkAevxdKIGAvJqW8S4
         kCeOiP5CadKwDO0VdULM16bXrjMG3d95mmecMHkbORmDr4Kxr8LAgejdWk4Gl/76YrA0
         8xHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=3ZHK3vEh8ndmFxb4KjOUtanJEShBbkCR4uH7p9d7RHM=;
        fh=/SviTIaqxTzHHYPxkjS8pq1bWql+bndpuOeJjhZ9g24=;
        b=yhqalHXpsKbPekg5y1/PMWPN2mcSz29zP5Z4cK33IfKNZ6Cfmy2njWjFpqXkKGyZbM
         qmsVRJjb7IwVaiSEkJK6m6xWEm/eLkhsviBk6atkqPvuH7gLElsPFuofHOQCPIzNkGq5
         He3woYly0s269DrjJXq299JCNk1eHcFAT0D+tUfOyC9MrTcl1u7ym7PW4Nlk2dLTLVxC
         ul8oQc3gCJvDj5HNGKaG9euNXl6A30V4uPuWuNjN06LLRGJodsL6JY9TEj4OtQwpI3VT
         q+NO072IfifSDME4TBJPA9e1Onj70+ugtzGw/r+HHrX4OJNaxFMkdhoBmxb5pCTgdIR5
         swag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=nEsnu3ex;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11-20020a05620a40cb00b007759c22e907si5194168qko.142.2023.10.23.16.45.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 16:45:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=nEsnu3ex;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qv4bt-0001vt-VX; Mon, 23 Oct 2023 19:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qv4br-0001vb-M3; Mon, 23 Oct 2023 19:45:23 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qv4bq-0002cs-0w; Mon, 23 Oct 2023 19:45:23 -0400
Received: from [192.168.68.112]
 (ppp118-210-136-142.adl-adc-lon-bras33.tpg.internode.on.net
 [118.210.136.142])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6D45320059;
 Tue, 24 Oct 2023 07:45:18 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1698104718;
 bh=3ZHK3vEh8ndmFxb4KjOUtanJEShBbkCR4uH7p9d7RHM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=nEsnu3exw7p+L8vSjk047B044xcI46cu3zE8Uv1NTsMC5K5A1/clWiHZ085VMWDYi
 Fhr6RdcUmhUezcXVl6655V3vUuLQTTrNr3LgShWe8iBhs8vhHmlYv26CYTUfR+Y/y9
 WG0GeTMRMBJyTR5J0QJK6pGOBn5ji95Yt5Ks+huno8QRf/xuRhai3hT0uOUlL4iX5v
 ThO0oSOeemh6423abWoaoxMPxkVFkuB/NReeGHcti/ZhZco2REzoY6vjtjbGoR22qh
 VU6nfJVp0rm3viTOuNET85ChM+gtiAYKc48mAD82HDMHHZB77TE9HIGCQbSQ0VKcqp
 z5VRxUeca+jkg==
Message-ID: <3bf8cd017b5d1386e1ed15392c74ed647b993011.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/3] misc/pca9552: Fix inverted input status
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Glenn Miles <milesg@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, philmd@linaro.org
Date: Tue, 24 Oct 2023 10:15:17 +1030
In-Reply-To: <20231020182321.163109-2-milesg@linux.vnet.ibm.com>
References: <20231020182321.163109-1-milesg@linux.vnet.ibm.com>
 <20231020182321.163109-2-milesg@linux.vnet.ibm.com>
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
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 8jSkcuaSLcOP

On Fri, 2023-10-20 at 13:23 -0500, Glenn Miles wrote:
> The pca9552 INPUT0 and INPUT1 registers are supposed to
> hold the logical values of the LED pins.  A logical 0
> should be seen in the INPUT0/1 registers for a pin when
> its corresponding LSn bits are set to 0, which is also
> the state needed for turning on an LED in a typical
> usage scenario.  Existing code was doing the opposite
> and setting INPUT0/1 bit to a 1 when the LSn bit was
> set to 0, so this commit fixes that.
>=20
> Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>

I sent a Reviewed-by tag for v1, don't forget to collect those on your
patches before sending out a new set. Something for next time :)

Anyway,

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

