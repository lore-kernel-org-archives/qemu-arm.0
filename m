Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp3026375ejb;
        Wed, 25 Oct 2023 14:03:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtl77e0V9yTgFGrRyN3PAsCvSXBowUpAVALQ4J+e3gXM3Ujeh/IL2Lsqb3h8Gy3ELPLAob
X-Received: by 2002:a5d:6083:0:b0:31f:a62d:264 with SMTP id w3-20020a5d6083000000b0031fa62d0264mr11549934wrt.37.1698267781576;
        Wed, 25 Oct 2023 14:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698267781; cv=none;
        d=google.com; s=arc-20160816;
        b=cffMEB/7Q39UpxdBVU1o/rKsEi3j79BlgG3WrG8P7IAsPvikSSjidLXBLBVBQquX0b
         SQblL7DEGQvubcdXLlE8PjmWfeKtElXyK07MjqYGatpblM2/dBuFhFQryIdxLebcIlek
         H8XTyByWhrTiJc50lD7eq3aitgykz7OCMjx4bc35gFbvf5xzaKrs+SRZKnV6Le6Y0gfz
         jqFSg9O+uB2HaVZN6tJTawTAQSE4ujM7sEImW6HjsGNTcTaG91Mk68zecKeKxOqa2zoa
         gS4oadCsw4U7qSg6nbqStmL/jYUCWwSOsaWorseO2tccjgjlU0VDuPzMi6dJbl5sprWx
         Lp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=yxnXOJZYcudgypIjGjRdsQy3XqC6eZHek2x9rLh4a4I=;
        fh=gHgTXW+HYQlfXOTlyX5PQSNotlP/s1ZHeLT9aaJYBuQ=;
        b=yNg6Ws8xWYhdhYJwAgto+sXrxCMGi+2fk+cCnWsfvSWTHZ+rCM4V84zUbp0G4CqMdN
         msOWRQILjKL2Hb+L8f7wRUIFFRexUOtV28Nyq5XPYqSlGV/3K96+Jx/tl4/H2STJO8oc
         uqahoqXZ25fhVnNB6Svl1NLVZbXog3Zcy5Ca4ZzaH1ZtJpvgGvBqFDCJ0qpsmfZGDljk
         RgwsU3qNPihhCgi9hhwpq5h3ecAiyfRhDWQ853x9p/LcB+DHY2PD3KeRVt8gPymzduGw
         AJZgvVBJVa/QevNAeshzFstSF4TizHWJER1cYSjYonZ89HW/ZNqAgLVmy75zMaV8yiwG
         Z6WA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8-20020adffe88000000b0032d8be2057csi8025553wrr.689.2023.10.25.14.03.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 14:03:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvl1c-0007S1-OQ; Wed, 25 Oct 2023 17:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1qvl1Z-0007Rb-52; Wed, 25 Oct 2023 17:02:45 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1qvl1W-0000Bj-Li; Wed, 25 Oct 2023 17:02:44 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E8458756066;
 Wed, 25 Oct 2023 23:02:39 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B16377456A7; Wed, 25 Oct 2023 23:02:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id AF77E745681;
 Wed, 25 Oct 2023 23:02:39 +0200 (CEST)
Date: Wed, 25 Oct 2023 23:02:39 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>, 
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 21/23] hw/sm501: allow compiling without PIXMAN
In-Reply-To: <20231025190818.3278423-22-marcandre.lureau@redhat.com>
Message-ID: <c24df8e7-949e-a0de-2ddd-578fc4e73aa3@eik.bme.hu>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
 <20231025190818.3278423-22-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1784342453-1698267759=:42723"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-TUID: G7J+7zxJpjCL

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1784342453-1698267759=:42723
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 25 Oct 2023, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>
> Change the "x-pixman" property default value and use the fallback path
> when PIXMAN support is disabled.
>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/display/sm501.c | 46 +++++++++++++++++++++++++++++++++-------------
> 1 file changed, 33 insertions(+), 13 deletions(-)
--3866299591-1784342453-1698267759=:42723--
