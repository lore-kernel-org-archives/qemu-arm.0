Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6881821wrt;
        Thu, 31 Jan 2019 05:43:25 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6dgHcbX3RQhA8dbgLaqqI0MXAigUmosR/pDcPB21qr1ogJhiRXsgO5rCYnICCXORgxgLsq
X-Received: by 2002:a25:c3c3:: with SMTP id t186mr32403622ybf.413.1548942205153;
        Thu, 31 Jan 2019 05:43:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548942205; cv=none;
        d=google.com; s=arc-20160816;
        b=1E9mrS4S054XHXB84K4t6QnPud163Wd/zEoPtzHoH/krDe1Sa9asWQvxYQayQ8tx0i
         9h/mE9dFBuYNsMSVPHJj7kipEUHf+vadH/fi8zMgb3Ll/f2hQnEnIHg05yB6OorxuS+Y
         cKYwbNmVNFo0IeEUHNoF19krGQEOFAZYT/3QhrPp/UmWml6BYniADaewhHtx6dsL0u2k
         RDtduUwcJHdawuLX/wBmNUjKbnPhPNhVLmTtXNbIbsZTbpYC2475YZRNYDGT54rtw6+d
         WT69g4/+rg4ZZLG39suqWlgk4tIdii6zO1gxmCkZBtL1EKdLRpYqscBxCr9Xk6xTZIkM
         6pig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PFdPvMZgcbMx3dKBusNkWACQS0P6Km2/84b0Oq/M7rw=;
        b=jYct2LDTKSaY1ku5rP6VVrmnY34opDwqOCnSMILwVDAmBmuHDNW+vE6LunMtfZz4yw
         DbxdZaZ/5bLxHzLE+rG3yE6FHdMduL0bH3UiNgVk+QPCV3hnGGhmjEQXw013+WFYRota
         KTp/5HmGSYt3745urNzU7u5oFtwFfpJmN63M+oQ/J5FwoT8d+PV/FoRMpVrpXFJiR4/I
         lbBa2uPND0Q3m6Yea6p6I/gvs8c8jnJcaCBKhP66Ak+v40wNsBz+/I0qKoonYche4w9U
         JG6n/7ZuzsK9U9qfWEpaiTNsYMSVqVWven7n6i3xNo/6fDnRbpSTHUS0FSoClFEeqve+
         86XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WQ7+lDdd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u130si2703016ywu.26.2019.01.31.05.43.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jan 2019 05:43:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WQ7+lDdd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpCcm-0001u6-Jy
	for alex.bennee@linaro.org; Thu, 31 Jan 2019 08:43:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpCcQ-0001sR-B5
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 08:43:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpCcP-0002A3-Nq
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 08:43:02 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45166)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gpCcP-00029s-HK
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 08:43:01 -0500
Received: by mail-oi1-x241.google.com with SMTP id y1so2688114oie.12
	for <qemu-devel@nongnu.org>; Thu, 31 Jan 2019 05:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PFdPvMZgcbMx3dKBusNkWACQS0P6Km2/84b0Oq/M7rw=;
	b=WQ7+lDddLm04TTmW4jo7wbCrW+IW0ag5kPt36b6+bibuj1iuIl1Xqam1Et0eSJUx91
	pghqJzeceW5kMvsdeBQWqcyLLfaz3nM6ZjmHa5kv8cmD1VFbcnKMdJqmOUHQsP7GWngg
	glnRlCEL5n/RRsnEq3k+8qTXTvidc0QEcdWU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PFdPvMZgcbMx3dKBusNkWACQS0P6Km2/84b0Oq/M7rw=;
	b=JCTN0bGze9LdXkK1jcBzfupNYanVAFw5Vn4nMLLzKbRizrtsGq+G8WqqUieRg4UjxC
	dpWDWl09hSYw/Xc/V8s+44P187DkQe/tNatn94JSdsmZ1iRD1E3cDUbhqwymQ7zyoOFl
	sG6zO5uZB+/Gw9/2i4Djmlg0XpzGudkSGZlbMgz/a/5pcZQBDhUX2QNJ4QfMXo6NSslR
	qQvrGb/H5RBk0/11PNNfnBMHT1xF3qSe201sH1AsNP16Jv9Kb+E5fNoYKo0mp9LOCcMT
	PeGKTCghGMtvArD8t2hY9UubemTZNwf/iuTvmy+4IQsmAiMjTcuutXMbqTsUKdVDRMkX
	H3jg==
X-Gm-Message-State: AJcUukfQCLHP6kI0q7XTRLTTp5rNQ36arQjmRmhvZQA3rzOnzs8hGHHg
	+YxTVi4h2+GBolpKKy8cQSHKQXN9Bh3/4MY+bDfQuA==
X-Received: by 2002:aca:1e17:: with SMTP id m23mr15823345oic.332.1548942180550;
	Thu, 31 Jan 2019 05:43:00 -0800 (PST)
MIME-Version: 1.0
References: <20190124162401.5111-1-aaron@os.amperecomputing.com>
In-Reply-To: <20190124162401.5111-1-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Jan 2019 13:42:48 +0000
Message-ID: <CAFEAcA-5X8SL5kSCztpEr7dR5Nz8h3QSrYVJs_1+MVZiEdFhxA@mail.gmail.com>
To: Aaron Lindsay OS <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v12 0/2] More fully implement ARM PMUv3
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
Cc: Wei Huang <wei@redhat.com>, Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QBSQVgybvCX9

On Thu, 24 Jan 2019 at 16:24, Aaron Lindsay OS
<aaron@os.amperecomputing.com> wrote:
>
> Most of this patchset implementing the PMU has been merged already, but
> the interrupt-on-overflow behavior had some additional review comments.
> This most recent version fixes a type promotion issue and adds Richard's
> Reviewed-by's.
>
> Aaron Lindsay (2):
>   target/arm: Send interrupts on PMU counter overflow
>   target/arm: Add a timer to predict PMU counter overflow
>



Applied to target-arm.next, thanks.

-- PMM
