Received: by 2002:a17:504:5f68:b0:1be9:327d:8ee3 with SMTP id gl8csp371873njc;
        Fri, 27 Sep 2024 07:19:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+p0obWyMopvB6A0pxQKXP9ziyqp/fyNE+H24RCKLemujBKk+/BbeEAoIJGGvbHtlaZTwuJk4fUz/RSg==@linaro.org
X-Google-Smtp-Source: AGHT+IGcFH6amc8cF8UVe+iHZY6wSRI2O/JtGlpjEpg8Uh14CufbbEkrJPOcQXn8OUUqA9b8raIH
X-Received: by 2002:ac8:59c8:0:b0:458:26da:45e with SMTP id d75a77b69052e-45c9f20a917mr50409461cf.19.1727446781929;
        Fri, 27 Sep 2024 07:19:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727446781; cv=none;
        d=google.com; s=arc-20240605;
        b=SKCiVcGaYfiWPCUG3+DlcZS3RTQZJHd/mtcNrYZqxS9wJg+tARvld9fXDqpC5OJ3b6
         fCYYsOiyNginnKxYKQS00fSpjpHdTfzRCABCoi883grpfMwdasM88hBoxVvpU4KFsJjd
         6YkPDA48PQzPDglkvctObW8Injirhl/xjir8M9OlpknKTTeEHdtY0UN4ItgpL+qKG5M5
         Z5HNjkCikrNi3aB7CvaFRWBpup1qvQxnlI75JwmCXboHEhmg3sOYkdDF5GK/2w4VlngG
         JSMY63Q6NDPib8PClbYvFQvEnDhSravcyM7nqabRX4nQ0eMDFbuTEdkCVb+QXjrlhmdO
         vmnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=4Qw66aT0prvkjEntuv0+aqIZqOq7VhylPtAZ4r9qO6s=;
        fh=yI+k2UY+hRiHWEd3Y6/vCaTSX0OW52/SpBGaPGuWMRY=;
        b=OeU0lMhCkVcDHaPYzHH2HZiJhlXac3Gssj3IMHn19Mq77V1VVE8EIFR/dsaLciS0Vz
         ZgfZrmcZiRgc9ezlsn8NR9mvtAucJXF3MgUkuDTqCfYnWPxdQCngw+mmBxzeeM2g8Iu0
         Cd0uCj7YKYVdkEt7lfAeD04dxsQI+aU/xy/rzikKlBQ74DKbTpOJEErB6Ty2eqrZYN/3
         hV7ZXdDxiCiGrAD+LaPOPf4QQYPKIsdI1Ez54N+0r4KeA8orfkr2IAkaIHk46eq3RjWG
         itrufaYSrBxyaw62h7F5UoO+dDRTmKtx9R3xMuU27k1ptZm6lg8E2ceflXfEriRUAwAh
         78xA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linuxfoundation.org header.s=korg header.b=1LKn5407;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linuxfoundation.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f2c0f84si22278421cf.198.2024.09.27.07.19.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2024 07:19:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linuxfoundation.org header.s=korg header.b=1LKn5407;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linuxfoundation.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1suBo5-0003o1-5Q; Fri, 27 Sep 2024 10:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@linuxfoundation.org>)
 id 1suBnt-0003m1-K8; Fri, 27 Sep 2024 10:18:41 -0400
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@linuxfoundation.org>)
 id 1suBnr-0004Yx-Ui; Fri, 27 Sep 2024 10:18:41 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0D22BA45755;
 Fri, 27 Sep 2024 14:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4111C4CEC4;
 Fri, 27 Sep 2024 14:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1727446716;
 bh=rVGQPHPfwKKZ4yeuBLKDhssza4GHweq1cDaD9ihs5Ew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1LKn5407PWm0opmOgd2DcYQv+n1k5QNzlBChIkspZwK5FcotXZ8BrkQygv7MwuzLn
 n7TP0NobFVhGFFjSCkHOb1D1XW5uwqxipThw2TwgkF8L7a5npythXYpiDRP3P4LMXz
 MJmplrLU+PQo2ETP2N1o2Id3fjuyNUCdizJIcSOM=
Date: Fri, 27 Sep 2024 10:18:33 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>, 
 Yunlin Tang <yunlin.tang@aspeedtech.com>
Subject: Re: [PATCH v3 0/6] Support GPIO for AST2700
Message-ID: <20240927-nondescript-fat-ringtail-e13a10@lemur>
References: <20240926074535.1286209-1-jamin_lin@aspeedtech.com>
 <e1076f8e-2e32-41ba-adf4-8e28aae8e526@kaod.org>
 <SI2PR06MB5041AC649E5F76F2700A42D9FC6B2@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <1f517713-bb9c-420d-8dce-9423123a3eab@kaod.org>
 <SI2PR06MB5041632B8C7403F6B4B9D4F6FC6B2@SI2PR06MB5041.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SI2PR06MB5041632B8C7403F6B4B9D4F6FC6B2@SI2PR06MB5041.apcprd06.prod.outlook.com>
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=konstantin@linuxfoundation.org; helo=nyc.source.kernel.org
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.15,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: /q1ZNG+i0mBD

On Fri, Sep 27, 2024 at 06:29:22AM GMT, Jamin Lin wrote:
> > Also, your emails have an invalid "From" field set to
> > "qemu-devel@nongnu.org" when retrieved with the b4 command.

This is almost certainly done by the mailman list running on nongnu.org. It's
a very patch-hostile setting, so I'm surprised it's turned on at all.

> > I have been fixing them for a while. Could you please tell us how you send the
> > patchsets ?
> > 
> > 
> Command to send my patches as below.
> git send-email -cc jamin_lin@aspeedtech.com -cc troy_lee@aspeedtech.com -cc yunlin.tang@aspeedtech.com --to-cmd "./scripts/get_maintainer.pl ../v3-patch/*.patch" ../v3-patch/*.patch --no-smtp-auth

I suggest you generate your patches with --force-in-body-from (or set
format.forceInBodyFrom in your .git/config for that repository).

-K
