Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp834540lff;
        Fri, 6 Dec 2019 06:42:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqxUs80Il59GjSud0XgIddWbKgBpE+y/FOf0l26xV4IgvWNpbfTk60xkUefx10iCn6ytMX/7
X-Received: by 2002:aca:1103:: with SMTP id 3mr12610863oir.171.1575643353605;
        Fri, 06 Dec 2019 06:42:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575643353; cv=none;
        d=google.com; s=arc-20160816;
        b=vuR29NXqG8AciBTgsXN2aND1U8WvWhIHb5C42xU9oB7JfT2xucEgrDWrJjC0jfuXaV
         22BoLTc+rOTu773GEB8oiUxQh9kOY7FxToxMdNssgSknI8yFhm9P7FE2Bovz+xSoXrAR
         d0B7PtUWf/ECzPwXSnVSzcd8LgfAHd57sxFhOQLXyh6HyuJXxWaaC8Q21zYJnEEDApk4
         tfFUpOX3Eq+RdYIkAxTJbpNrPliR6/GuhaCpQU6f/BKepGqpEkaNfSxM334+gTDKqCBy
         pR3pidKggLg4fje0Qp2mJqckPlYOx42Q1Ma9ZEWsn4voyMxv+9u6JqrSeXxhbZw7CwPK
         n2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O5nsFOtjimTarn9GS+btDv87kUC1vCLmzpNDta2HK4s=;
        b=qff+SbkevjNGZxfeihhenRgQe/K4lg2AqGn8RndjlXF+0gEnh17Ed7USuH2pKZkqqL
         YuBzqUElWfDoabf35GIeulWxYXF6KRuLjnOQy83Y7tLWbwm4uY2C+fZLY6N57/9buS7o
         7YrA64zAEHCKlU/8Sf0M+1EybqiCfk8SEVgZQSH/zKjlcZPNN5f28KFiwgPE28hBhLcn
         ZGesr8TvVTDjHpOKFlXSwp1NuGkERVgWoKQjaT2vwkzJaGopa65L2UwWYKpYusvTmOPu
         UnxqG0rX77eUmv+q+ARA+Ua5p7JTeNeNMb6d2SRVKEo2rTacRDPPdz5YG15JehigE4Fr
         3GwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L5jOzS15;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si6804161otk.66.2019.12.06.06.42.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 06:42:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L5jOzS15;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1idEoS-0002aN-Ca
	for alex.bennee@linaro.org; Fri, 06 Dec 2019 09:42:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43922)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idEQv-000497-SG
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:18:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idEQu-00056u-SM
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:18:13 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42302)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idEQu-00055c-Mc
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:18:12 -0500
Received: by mail-ot1-x344.google.com with SMTP id 66so5893020otd.9
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 06:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O5nsFOtjimTarn9GS+btDv87kUC1vCLmzpNDta2HK4s=;
 b=L5jOzS155bNCJ4UXbeMy8WfpGFnhylLmy6JTayxrFtoocFrgo2Aw2oRJ0YZKjnn0VJ
 xeiluYE6eu0Mv5RqFmD/QLeJll5t92+PRB6GFtg3BkX5T8lEjjabwqm4c/ndwt/6kvdt
 ZmKCfFPgkxQga/F5ExQsqnaobyvDIOUsKBnLYyIHrw2nAfZsaIU0/mqQNaEtKJJ+SE/J
 pgDUhrpbYxMWfqMx4V4mVn/Su15wtVPPM6S47Gb7VBZJBU0TiCXT5RCB+57+jYoz/Ttp
 7j9PmUFQrKXEa1ncKT59cbS5ETBu1HGkIjurDbwzdpb1BdKB9FzKBW00a1zzL7ur9gGE
 Vghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O5nsFOtjimTarn9GS+btDv87kUC1vCLmzpNDta2HK4s=;
 b=IC3V5SZbadM1bHCcEpOUwtRB18spW2Cu+Kpigw4I8aWP6IetchiloB99TBXeifdibj
 jm+ZQESQbvswlWQ0IdEZ9jZQS5B0ms4k9Id3LGulXZKuIRk8sc7WOpU6J3dDpRl7EgXN
 K4GfcC3gMgoV/Jj4vu1XCD5/NhD4GYSkJOUpWc8+8SHLD96CyRbgYpTG2ofCLvffmYtU
 vGsPTe/rjUs3Mc52KXw8D5JAFtAaj7TwqcgM3x3ADIzttzSCk5BzB3RWLaDc8RAiTUxQ
 jnDH+K8ZS3QGL8eDBFrEt1FpEm3j8fV6nieF9pz4crQDgffNCOl9gKRaSxXUEXdq5WMM
 8LAg==
X-Gm-Message-State: APjAAAV1csxDItmrGoa9N9EFfNdjanRRn9dwOXabqrzO1Yf/bdr55DQo
 YyLzQZBakFCa34OqkI7J/DmF6gcd41CrjBAxDAMNxAQZ
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr10680515otg.232.1575625923512; 
 Fri, 06 Dec 2019 01:52:03 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-21-richard.henderson@linaro.org>
 <CAFEAcA93AX9nikuqq9M1jZOxv1a7QJZpiocHnn=n-gSbsGBS7w@mail.gmail.com>
 <bcc3ff61-e737-2af2-5c0d-a6062cbaf083@linaro.org>
In-Reply-To: <bcc3ff61-e737-2af2-5c0d-a6062cbaf083@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 09:51:52 +0000
Message-ID: <CAFEAcA-pB5k6P5RS+BoFghrvGarPAB+OcAN38NouDhu_uEhepQ@mail.gmail.com>
Subject: Re: [PATCH v5 20/22] target/arm: Create tagged ram when MTE is enabled
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IlEH5DNfukm5

On Thu, 5 Dec 2019 at 19:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/5/19 10:40 AM, Peter Maydell wrote:
> > Are there really separate S and NS tag RAMs?
>
> Implementation defined, I believe.  As with everything about tag storage, it
> would seem.  But since there are separate S and NS normal RAMS, I create
> separate tag spaces to match.

Yeah, it seems like the obvious design. I just couldn't find anything
in the spec that said it was possible. I'm probably missing the
relevant paragraph.

-- PMM
