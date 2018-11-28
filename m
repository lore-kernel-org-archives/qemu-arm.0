Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1181725wrt;
        Wed, 28 Nov 2018 07:33:23 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UhmCiaw6dU9p7Q8kwv5/n18qJDbXnNW7CR7a/yXfe+Dj0jSWFaobIIGjStOvS7CRwX/u9j
X-Received: by 2002:a81:8d51:: with SMTP id w17mr33756393ywj.104.1543419202958;
        Wed, 28 Nov 2018 07:33:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543419202; cv=none;
        d=google.com; s=arc-20160816;
        b=irgaCAeRC+PKGUodaSqJ13yabEIfc7AlhXn0JF10lu0YF6Ei0IxN3tcNv9LYRwJStI
         VoMIBViNcRtCnOhON5avtDwdQHXcYyAe5jZFOI+7ZSqiMfALj+mf873+fccdxIq7VloM
         ljzf3finJk01BPKnEv/tvQTTBcVEwe7V3erTLDJltx5eV8ZduXE6RkfKBYDVbVCWpcPc
         U3p8j1j/OsW1YMk9xDKzZ8izKO9JtkBL681BKqFMeZnfhJIR1fs33pcuEf657hZZcvp9
         B+1cL7e7Nf4jLdfyXQX1WTYu1dkkN2dUWIxs5DkoUxRU8gaO9tLni6yA87ckNTEeJ1EW
         Dorw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1EkaJqvFwCfUfsfQlciSSDzUVXaB+7zIPpfhjIQh8DM=;
        b=rP8ptzh9z2Ga6yqNAE67Yg5SKxXUf8+HtRQpUCwt0wVZ6LqKyb13bSzlPBcG4cJDlr
         Hkj+tU7tM9efUgqqdT/5me3FwHAi88cczfhsRbJq6TM3rqztUwN1RqwgIpTX/fSN8NEy
         5EjDXSFNZ8hqLLB6jkJHe+xLed6Y+zFhsgK0TQRvbSBOWw59wZhVOp7wViik3l+uOWZ7
         0T/nYwad/IDDRkqMeuJnAvYr/Mw1o+tdkcwkoo2QGWlbjJafQtKd7UTWAO4i7/ZJ3FZP
         LMFk7JhNO7uIFSKBsxhYb8F9MNPNM6Jn7ngQ4l9Xkj67PSxiW19ujDOf8lMrxOFOuGJe
         Zy7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Uby7kQP+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 203-v6si5188283ywo.361.2018.11.28.07.33.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 07:33:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Uby7kQP+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48344 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gS1q6-0006tI-DW
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 10:33:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gS1pU-0006kK-HF
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 10:32:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gS1pT-0003ql-N7
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 10:32:44 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42672)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gS1pT-0003q1-EW
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 10:32:43 -0500
Received: by mail-ot1-x341.google.com with SMTP id v23so18445937otk.9
	for <qemu-devel@nongnu.org>; Wed, 28 Nov 2018 07:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1EkaJqvFwCfUfsfQlciSSDzUVXaB+7zIPpfhjIQh8DM=;
	b=Uby7kQP+FFDL8wUq9hyR0B7XLiBFqCS9HrfXB3ulDWshC4c0niVzp+ezwySg3F2JWj
	jGoJUbuCJniOGalZl9po/QLga5d6H+yUaO3kfYGV8mORdFuA/Qx0jY4t1ZgN9oiZNDhb
	wNz7gX21S8VkZxHfYurhPDrecHz5SgHf7qkYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1EkaJqvFwCfUfsfQlciSSDzUVXaB+7zIPpfhjIQh8DM=;
	b=oZTcLO+qRE0MVurdXS3mP+ptHXijQ5/kuUKaQEHq7t5yn8wCJiQFwMPDwJw/Ggsuij
	F1/NPBOZBmCbsnIrwjrdrQdvT4QpxpkZj6qTbUpj3EgaUcUEqDAeZ2SdBX4+Ub2wHYIC
	+JdWxbIP8zZ2GuA4NBGGYWvzL+XH0RMHk71Ny/CNGn7ZsXLxhtlnwOgX8xgN2R24xfLG
	DdYWA5dPzyKdmji0BbBeu3rPxi7hBUgSfvRDuyGz4edgj0QDfOCimRqujjQdY9r2hGZ6
	T9aMDfWinNaLpskffVmwgLFhS8HbqrK/iRtZvI7esIFvhDqc8eZsh+GzP3C1eB4mSnV7
	dyyg==
X-Gm-Message-State: AA+aEWa874UOuKiziRMHmbYdtNlD3+zEyHGo0r15ec+WpLc+DVrgTV5X
	6GBicO7LFxInpp+Hrtd/5YByFSlGT3a7NiyWpzClbQ==
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr22112936oth.317.1543419162500; 
	Wed, 28 Nov 2018 07:32:42 -0800 (PST)
MIME-Version: 1.0
References: <1543399094-2260-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1543399094-2260-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Nov 2018 15:32:30 +0000
Message-ID: <CAFEAcA8jBUhbUjixnXkFo8H9KMfFfZknG5HMxchp6UGEKBueKQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH for-3.1?] target/arm/sve_helper: Fix
 compilation with clang 3.4
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KkGsDnGTd83+

On Wed, 28 Nov 2018 at 09:58, Thomas Huth <thuth@redhat.com> wrote:
>
> Clang 3.4 does not know the "flatten" attribute yet. We've already
> introduced the QEMU_FLATTEN macro for this in commit 97ff87c0ed020c2,
> so use this macro now here, too, to fix this issue.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Applied to master, thanks.

-- PMM
