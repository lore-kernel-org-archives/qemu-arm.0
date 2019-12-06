Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp845796lff;
        Fri, 6 Dec 2019 06:52:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqyCD9cTD6c1YJjJNSTtbA7BlyW0c4L8ajRg54T/HBr5LXFWmw+YQ0fYvXj34MW3XPy3na2i
X-Received: by 2002:a05:6830:58:: with SMTP id d24mr11155714otp.356.1575643941505;
        Fri, 06 Dec 2019 06:52:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575643941; cv=none;
        d=google.com; s=arc-20160816;
        b=WSm5fAHhUBFGYC2L+DPDa6+BdwgL3BxGZoxGK5TXznPih37iyz4A/sR5t/IE1zshHG
         A/34WSzPkb0rv5m7phnLYBRQU8HMtIaAHIJ1JD5I50QS5kS/ITvIoKsMfOewsBLP435X
         7Zfr3h7iUjBEuE2JEeCXYz3PPMdQUgJD1b2qSgwMydQwr9payzVLz6JOI2tTzLWFP83Z
         RYV3C71Q4Yxq4muadHcYXKks+t+g6MAAswyRITFYSGmqGc4ATQBQxiyTXUh8piZYMtif
         XJQBCtFPdASHMCGaJPPpFRmb7N+q2MFy7askiwAsXSXep6WF40k3iWo4AkyJd8i+81IA
         Lm8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dmq/2j6nGIVBQGtDL6jBJ9TApdnLutBPJ157fatWu+4=;
        b=yvZdzVibOWprlMhYtVeEOV1DZaRFoM9YOsUxQTUaN/iSCzfdfQz0DqseU7HGkgQzRD
         WEuiCsgKUftZmhyrs5ITahZgsv2i10KpOA8ai2pv9/PQik/FLXhDaoXoOozYGwSGdS3N
         o6Kqsu5/+S5DZ7PCv5hAl5eL3YtmRAeIQBgOuRsHJlDnIGm5BbuwTiBU5M9wxhjaxFFi
         TFmWeF09waExgMZe8lM0XzX9zsZrWnU+h3G+cUEIYbc0qtoJG/LoB4QGTq70Us1/jNjU
         tydFHmcCAhrLnJAMh8Umtpij7lLZup6w9s7FlhW3OgiFya6q4nnNEnjWcPEMlFK7XNLU
         +nPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zLbDDOl1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r22si1551400otn.192.2019.12.06.06.52.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 06:52:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zLbDDOl1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1idExw-0005pO-7v
	for alex.bennee@linaro.org; Fri, 06 Dec 2019 09:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40064)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idEQE-0003Mj-Dc
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:17:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idEQD-00044P-As
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:17:30 -0500
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:36231)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idEQD-00043O-5X
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:17:29 -0500
Received: by mail-ua1-x944.google.com with SMTP id x15so2871472uar.3
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 06:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dmq/2j6nGIVBQGtDL6jBJ9TApdnLutBPJ157fatWu+4=;
 b=zLbDDOl1dLgyWsvAFLYNoGci9uF9Va2gzT3W/EoGykUNumLA2qDUDlRxfhLo37nbu5
 70eROptPAgLUvinZlMMwTqlAsRjvhiZkSg3cCj6FJ546zml5Lqikjcg98SaYOL4qTPLD
 pFBciYWkmfExoPToBX10HlCV/ds2vqXeklnl551MiwCRCtSIUL3sNqGwqZxCuwexGSVN
 i63YxB5aC0n0XUUytuMO6IqABiyx//NcXOsvtoN23JkVym1QygAmsmY4XqUH7wRumwbZ
 1zWQwQVCZnMndoRW8ylkqFV+g+zmngXtWr02YbycILpIWz7FYZYySEcWhBR3f6ruwJrN
 6eJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dmq/2j6nGIVBQGtDL6jBJ9TApdnLutBPJ157fatWu+4=;
 b=s1eScI8HdtnHCdbAEmAIIQaSInyHV/2091kD+/YceoMgZngpZfuSPF0cvUbedWcrdR
 Yn/1WBnDzpvTa6pLZUfqiM6bmVgQFfF1PechrPlC/8uST+OhBBriRppX7Se5+UOW6ME9
 dfb3166zfmdDfbQwc4tXAH9OxqPfCy4xWsmxw9ql98k9iXi6frl7XXxR6o1j8KsG/C/I
 tH6qNOG/roCRuKmTj4sM2Wgl3Kw7XpytKspLtMmhrGXVREs2FZseNU+uYi0HjoR3/Qz9
 m4Lw1lHA3bXlwKskQ9r8JSjXrIUnx16mqz73qKz08hhafdfBv1f2dEJEe1qfpjJejvDa
 fHzA==
X-Gm-Message-State: APjAAAUaqGnoL5KFAKjrFpmuAhbJr8mi/EZUuy1J8nyGMxNMftOcQEW5
 82m2it1B0mhfVJqu4VoJlUb9qtpAx3QGsZq35ZLGpxdK
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr11025372otq.135.1575638646107; 
 Fri, 06 Dec 2019 05:24:06 -0800 (PST)
MIME-Version: 1.0
References: <20191015163507.12153-1-richard.henderson@linaro.org>
In-Reply-To: <20191015163507.12153-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 13:23:55 +0000
Message-ID: <CAFEAcA9xAkQ+mu=0Y3M3PKbFo293WfiM5VGxp=CqH7Np_EmwHA@mail.gmail.com>
Subject: Re: [PATCH 0/3] target/arm: Implement ARMv8.5-MemTag, user mode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::944
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
Cc: elver@google.com, icb@rice.edu, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: seP2qxa5fz1n

On Tue, 15 Oct 2019 at 17:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is a refresh of the user-only patch set from March.
>
> I do not attempt to implement any part of a kernel abi wrt mmap
> and/or mprotect.  Instead, it uses a x-tagged-pages property to
> assume that all anonymous pages have tags.
>
> The tests added are disabled by default, but do pass if you have
> binutils 2.32 installed.

I'm going to skip reviewing this until we have a defined
kernel ABI to compare against.

thanks
-- PMM
