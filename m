Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1462022lfm;
        Thu, 25 Jun 2020 09:29:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyttr/Rp/XEIy2LLHnVVhAgxIuy+Lyc+IdWmj/r+rw5aPdB3biBHUKUUo8JBskN1cTCGQfy
X-Received: by 2002:a25:4e0a:: with SMTP id c10mr27366193ybb.281.1593102587835;
        Thu, 25 Jun 2020 09:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593102587; cv=none;
        d=google.com; s=arc-20160816;
        b=yAnG+EVZQ73k8alOXdgjguGj7nkFsRhE3lA6+FgnO2aG+Dx+wzG+lwzcn/B3qGnFxW
         huNKxjSA0SyQvWRzwRxkbJ9jXD38ETyCdfXL2tX1GWMuv9y7zi+6H2ADyYLFcEufneSm
         jSw763G8AqV4PhAfm0O9xTiA5oXRgmbMNhcweTCRkzHrEYZQFZbL4px2ev2Pz7SSVeKB
         yOftgvnHyFKdFuXkmd4vsFVVTD3UjHuLL+Xj6nw2lfkcgm/YFpFy7W7mmwM0JuF/mboB
         GhUsrIJ0aRPbyyt7RGCPgLnDfIUm/3/dV01lHOrhpS1kuQ6PhuuRyDasnlQ1ujXNc24R
         9q6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ddiux/sYQjnweRf6rcjF7Ygr1+nd2QQjo9m7w/+qT68=;
        b=ITYBljkJYtfWkZNnmdV9oFJAiyVW3h9YeATvy5KeEYHQntAk0G+C+ZR55FS9ASXgqx
         U58C3n+bq/GRM907AoYqrBUwOjcSHnA+7mZfUpuMiy6jGCEmkoOAgRUOeB1tvtOfS0wv
         k7z2jcF8o1VO91XAE4ktcnTjjF+BCxcNawXrWDHrQz9hwBG0Vb6ZnlG9q6rHBKbV9Krv
         ljCJn1ZJ/QNU5QSSrWEZ1467jeCW1yIqdgozCzqR6E8FkiiSIkerZjWq6dzwJRwqudJj
         EfAE66NJq8AOzRQRqXgrbw6egaggzK+tX26RYcVvCXMGeJu4iIpRwe7l4uEIAfBHlSa0
         nHCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="p/lyoEpP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1si23009593ybg.130.2020.06.25.09.29.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 09:29:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="p/lyoEpP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joUl1-0002YL-6s
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 12:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joUkt-0002Xw-3C
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:29:39 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joUkr-0002SO-EC
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:29:38 -0400
Received: by mail-ot1-x344.google.com with SMTP id u23so5805834otq.10
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 09:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ddiux/sYQjnweRf6rcjF7Ygr1+nd2QQjo9m7w/+qT68=;
 b=p/lyoEpPTaiI1U47P1P1QLjWIRtOJANV1Z2K76EeuedCRb2ZtfY24lxikMes2T0GSy
 2ui2ThTsvhBGFeBt1F/rbKzCq7zDy741+trUG5OmMX4eE1FZTpbb6lXAY1WiuCfuxsHT
 zt2GFEZEfqulOYMLjw/R2F3xo1YIhkohXgevtw6xOueVSOvf+hbRI1dOKaqFfNzEEJRC
 Sv6dfMN4DWt6NgUl7I8suVx8O4OLcvJMc9b9O8hJBIuS2iAHDKSBuph6f2C7yZm4nASg
 ii8k28U3oCA8zDuvxfRYBtLJjTZ/iGso1l5WZyFrBPcAXGnoOyx2MsYhGlF4j/2eLLu9
 181g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ddiux/sYQjnweRf6rcjF7Ygr1+nd2QQjo9m7w/+qT68=;
 b=XkBREh53hyTOuybx9UPlArIrxP+762SjaLjoenOsnYTpLQUWI7Bki/6jqw37fMJfq1
 TjcdGdUI3z8JgOcLmj2hK/kdSDJdlIaTC7eZh3k/8Dl8+kDHAD1rCmnVP16+P0axd4i4
 JGiqsWATPiS63a8yXnKiW9fzXdtW+rsAXDOy8/HSinIEuUP0xvFgZAIpZsvw+Lw/mMOj
 x0OF7Lv+Zchr3zLygylYGpIGWozEW2mO+4FphAUQ4APda/qKPTlZ0PSzQKOBd2Ua2Um2
 Omkl5+3/UGi7mA0Xb0PbHTKnhgY+I4kL9eaBN2Qo7I7ysfA+/vhMk9osV8bGE67U3Qgx
 CkHQ==
X-Gm-Message-State: AOAM533qWwDlzFw54sOCtuKZ4z2GIP5lYYgvB4SDG5IHXTHbQDFaVGH6
 +tECNy363ZhicH/KJFy6Hdzyh7CAj5Ouvg4RckLvUg==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr26297591otn.221.1593102576241; 
 Thu, 25 Jun 2020 09:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200605041733.415188-1-richard.henderson@linaro.org>
 <20200605041733.415188-5-richard.henderson@linaro.org>
In-Reply-To: <20200605041733.415188-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 17:29:25 +0100
Message-ID: <CAFEAcA9pYuqY5xB+z=3RxQmGRf0C7-bubsJiec5OprJ4goa6ZQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/17] linux-user: Tidy VERIFY_READ/VERIFY_WRITE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CZCD4UMgAZQ+

On Fri, 5 Jun 2020 at 05:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These constants are only ever used with access_ok, and friends.
> Rather than translating them to PAGE_* bits, let them equal
> the PAGE_* bits to begin.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Side note: at some point we would ideally want to support
syscalls that checked for write-access-only (ie some of
our VERIFY_WRITE uses should really be VERIFY_READ_WRITE
and some should be a true VERIFY_WRITE):
https://bugs.launchpad.net/qemu/+bug/1779955

thanks
-- PMM
