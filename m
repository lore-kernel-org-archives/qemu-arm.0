Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp274200njl;
        Tue, 1 Oct 2024 08:47:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVq8p6Nfxx/LIluuCE/CW4yPWcdhWgNIzjB4DaSpD0H9vRVbxGd5Txi+FuxPj+gbkdJguRRw31lb6+XQA==@linaro.org
X-Google-Smtp-Source: AGHT+IFTmT3dSwVRAx3zfVG42s8oaloiG9VERVQp20i1UJv5VGl4pX+t2Yoz0J3a+wh7yhO5elJg
X-Received: by 2002:a05:620a:1a1c:b0:7a9:b250:d57b with SMTP id af79cd13be357-7ae626aed8emr22543185a.5.1727797637407;
        Tue, 01 Oct 2024 08:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727797637; cv=none;
        d=google.com; s=arc-20240605;
        b=ESYc4IiSpSfgF1YGvvV5mvRmTpfjYHMJVHGoXdcMGYwq5OX4UvrFG8ofj6ZmyuUOQm
         oHLhqC6lJk574xyssHy49oPhljTgLC1jCj95rrc3vvwj+t4UvTt8To/iKEkDBbWvSehp
         cfxaiXV/N86OIYNIyahZ9B1y4RTgs6bl6c0tdw7HhdhEgvjzbN5j6vUzWRqSZ6ZxENJb
         wMm+NtareNietBN5FzwHYwjwPjaF+IWS0Bwxb2RbGCRdfxVs6aFi+yQOaRwQvwth7bDk
         bKix6ZBVmR6YPFIBYDTGT+viF2kxmAeGXcj2vbXd+gaue7YZE12k50M11A5XokyagEeX
         /RMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2vIRPIva2oUSmXVkDJAitUMfHspseN0nhtWV3ZtInJI=;
        fh=VTJkSWK2DHDUB2ep/ZMrVTcl7ElH9G+0gi9+LdYnNDM=;
        b=k9ios2G4zJoB5xYp4GSxYvgsvUV0D7itero4EHVHG9N/XKkyMNGYKbPgzAqepG8LpC
         yJ5RU1IB2+hWXqcOoC0v/r1faDBsenrxLbPWLahIvxIzZDqQ+d+zexmbQ3bQVGXTuwJv
         fve+1r5fmkXo4gbqtFzqTu8h7y86b79GmNy4RwXel9Uf6T5ggJT+GOjYLuYdTq7f1069
         jV56VIyNGU0GiU3UiehOFKIG5Aaatn9xwQ/RksGi4y29bKxYWkMWWEJRhE61WShw7yVE
         Z8IinxEp/m42b8rUd6SKJf8Pcf5HpHQZmnUAQAV6joAGce4m/117joplbR9b0V6rUDM4
         rJZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TIyZgARM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae37871221si1122725485a.600.2024.10.01.08.47.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2024 08:47:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TIyZgARM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svf5O-0002ep-AF; Tue, 01 Oct 2024 11:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1svf5M-0002eL-TL
 for qemu-arm@nongnu.org; Tue, 01 Oct 2024 11:46:48 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1svf5L-0007uM-Cb
 for qemu-arm@nongnu.org; Tue, 01 Oct 2024 11:46:48 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c5b954c359so6272633a12.1
 for <qemu-arm@nongnu.org>; Tue, 01 Oct 2024 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727797606; x=1728402406; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2vIRPIva2oUSmXVkDJAitUMfHspseN0nhtWV3ZtInJI=;
 b=TIyZgARMZ2+sOf+mFMA24ySP4jTk1Cy9G4bgyJMtYEgxbiVosaC/MgBrlZt4/FfXab
 /yw7CnRypQPOuUCIUGdPM/FzQdzHl0RAekB9MGC2uMYdXO+qYs2dxw+w+qAdgXIhndfn
 1eVSTCHgNufnzYNzlPxj17OBc+xZ0tFR4tbDXAOj+iyNTW7tI37PgBbf2HphN4lmwDo3
 AWHXMY/GGOx/O3xxgY9QyUj/XzmHe6jVWja1Sp0bJuAqLm6xxVdMMjcYkPE6mjcx9a2v
 WoSDVorZodXDqyVJ82g/59vXEbH6GN2D6Biat6Mn5bRNGCZ3kn7ABRMPGGeFfqowt6FO
 3wAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727797606; x=1728402406;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2vIRPIva2oUSmXVkDJAitUMfHspseN0nhtWV3ZtInJI=;
 b=v9wQRzfGdvKoVLcosmRBLsgzRUxSnXV2ARQHnEAAfSWZCMlRYe8bS+VuyMEp+Xe9zU
 9FNnLh1jbXX7iv01e0L8pRFtgTJEWIYmlu65tJXymBfGjCXJgPeJ2tTtK0/g+ZJ5RPux
 cyde0A6vwzbXM7uYzlN4jEmaqubRFMX4VPSnBh1b9AXBvKteEtiybN56OiAbCLF0zTGT
 tLvFd1rg9Ip1Xbow5uNotLxzpLEORbZbIRKo7T+tmhueeUW6T4p2ChwZ1gz3mNjOk2yG
 m/dlFfLsk1oMT0vVsh/+jZQ77NhpQmo/gLJRPt1huzs/Y2DV8btYBzbHbaPBo+DxLN9u
 5kXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO+bUe8m8fhsaz/QeQLH0Lm2h56llhrMQ3q/xpzIPn1bsFvWYvLyK4oCMqk1nX4trTDLBhVLo3Ww==@nongnu.org
X-Gm-Message-State: AOJu0YzIKGl2uPCqk9RgZHcrN0O6h7p5VqSS+sni6p7Cl+HlE7GmFQr+
 qn90ecR5tOZYnZIVsi5SZpUgnz6NIuwQNmsLtI5h48PbGvvfLpaxVowNVjRFeTLzZp1vmrILCUh
 pICixUFvPGYERPvnuzWBNe32wsfGOzHZBfY520Q==
X-Received: by 2002:a05:6402:358c:b0:5c8:9476:2bf with SMTP id
 4fb4d7f45d1cf-5c8947603c9mr7622108a12.35.1727797605501; Tue, 01 Oct 2024
 08:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20241001024334.834807-1-jamin_lin@aspeedtech.com>
 <SI2PR06MB5041260E63C468FB348E1F2BFC772@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <8e725955-8696-4809-a23a-87e390cccb5e@kaod.org>
In-Reply-To: <8e725955-8696-4809-a23a-87e390cccb5e@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Oct 2024 16:46:34 +0100
Message-ID: <CAFEAcA8cetzuXmwbTZFZC6fpBASwboiu2SSOznZ-GoFvQ6pfvg@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Support GPIO for AST2700
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>, 
 Yunlin Tang <yunlin.tang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: MFr+SrtbI9s6

On Tue, 1 Oct 2024 at 12:56, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 10/1/24 11:43, Jamin Lin wrote:
> > Hi all,
> >
> >> Subject: [PATCH v7 0/8] Support GPIO for AST2700
> >>
> >
> > I don't know why I send this patch series failed to the following email=
 addresses and got the following errors.
> > open list:All patches CC here <qemu-devel@nongnu.org>
> > open list:ASPEED BMCs <qemu-arm@nongnu.org>
> >
> > 2024/10/1 =E4=B8=8A=E5=8D=88 06:43:04 - Server at nongnu.org (2001:470:=
142:3::10) returned '451 4.4.397 Error communicating with target host. -> 4=
21 4.2.1 Unable to connect ->
> > SocketError: Failed to connect. Winsock error code: 10051, Win32 error =
code: 10051'
> >
> > Do you encounter the same issue?
>
> There seem to be an issue with the mailing list. I don't know what
> though.

The data centre hosting the GNU servers (including the mailing
list server for nongnu.org lists) had an outage earlier, and
everything was inaccessible. It should all be back up now, I think.

thanks
-- PMM
