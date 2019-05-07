Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4177100wrh;
        Tue, 7 May 2019 16:06:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLmU8EEdCeA7Jvbrj5ZbATrs+2uEgJAkx3TFJpPM9+4nmI/3tWMqBGM5pqRpFXeuAfMP1U
X-Received: by 2002:adf:da4a:: with SMTP id r10mr24074142wrl.216.1557270412480;
        Tue, 07 May 2019 16:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557270412; cv=none;
        d=google.com; s=arc-20160816;
        b=cJP5ccdTkx2EvIDA+gLPdKnhB95qJWQFg0D8+B0fPHPi6afvyYRq/vO/xvdQRTj1Q8
         Uk6UZ3PHMXLqP/ZoolylGqqNwgL4vH82bj621ns+TfvtoBkXRATwC/l2ioxJMYPxaWJL
         opc5lXRNoEQFLD0oDFSzc76wR+tcBbiNlC7AplUM+rTXZzRd/nMnJOReBFJyhpx6dhxT
         K3omIg+1jyZHqa2f66KpQqCucnEcVvFuLWRhIm2kEdkDnM7HUD6Ns6OQxldeZ47tNgIt
         qvfjr8u7LZAWZTnrOh2OxGf7xJFxFfNeoS4fTvVCKm8y+l3TjoNeOT6wzmKb7z/NsG25
         NrtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v59+G3txdigVLPUAwnTR2jZ/wtpRLqd7Qu9iELG8Wt0=;
        b=c8OXTNUAdqWyfx2AUsXPS96/yIjGQWf9hFURWjAHumXH7z+R3HojowECVNAd6c+ErW
         OoLhyvwQVwN9oPsdd+iXSHvS0y3/blqlEPTxWCiGa6zm3Tmy++KHmttk33XVGyA6+nHi
         rrtTLFd8Xsh76gjE64XN8lBtwdPuodYTwdEFe6GwwuaZ6hWohx/Upg6+qT448CCiCJO8
         CjZeDvxc4jpZ/OzbyvZZW7DlsrMKeSe8AEn6APtSCYCldo5MDNW5oDSP3sMR1d9O2ab7
         kc5YF6//x72ujlNq107d+p7+y7QPZ0LzhcfI5q1TrWa2UZjlMd8wA8w5SLmD7ebe6GKL
         MMtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VJS0Pl+g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f201si258900wme.177.2019.05.07.16.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 16:06:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VJS0Pl+g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO9Ah-0003Bx-H1
	for alex.bennee@linaro.org; Tue, 07 May 2019 19:06:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hO9AW-0003AV-3B
	for qemu-arm@nongnu.org; Tue, 07 May 2019 19:06:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hO9AU-0003Y5-7D
	for qemu-arm@nongnu.org; Tue, 07 May 2019 19:06:40 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:37271)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hO9AS-0003LO-Gb
	for qemu-arm@nongnu.org; Tue, 07 May 2019 19:06:38 -0400
Received: by mail-ot1-x329.google.com with SMTP id u3so11181850otq.4
	for <qemu-arm@nongnu.org>; Tue, 07 May 2019 16:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=v59+G3txdigVLPUAwnTR2jZ/wtpRLqd7Qu9iELG8Wt0=;
	b=VJS0Pl+gUSpEmmG9UbUJcGH/d8zAS92qUWKUJ63mhnCSTJYJ6zqmfnhQQjnZ+rwd37
	dh2G9giUSxHjkPz0smV3n65lKP3cDeptFTbb+yPBh2E9k8GQBLR80RiToMwh8X+7FFhl
	Dt9zZ5rmlVwjFw1Fhrh70qEHVbDAvGQq09rIpUisZG3FOZlhqBidsHtkXtHRkitoTG07
	I7y2+It1Lj+EkseBduwjMU5HE/CDolfbrIo3LaAE5R0UYEP81+DwdNUbzB+Jtza05Sb6
	qEeMygDVBQiw+7+ukC/e6G+n8s+HDJ/r3CujHoi+cNvFcdMs6ZTqFDosCBcLXJUKZswO
	vR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=v59+G3txdigVLPUAwnTR2jZ/wtpRLqd7Qu9iELG8Wt0=;
	b=gugp95gi+kkrIwy+NB0OhOyeIChIKR/5f7wZbKxTu0NR2ezFk01tmNyTDZpNyWRWCP
	VbT67/C2ITHix33kChXvic7deCh12LBJaDVGhYK+nk2HvNi39wVFAJx3pimmFag+Joh8
	cBuflboXUcxde99Clya18priDwjEYq2wqm6a7iXYeM8JGTOzbziSBQXirLZJBwsckGG/
	UW5DJgUc5Shxv05+GC54nu7HsM20kw4vSv1C1jUpo2UAc8iH2+MQUozB6ECVRzhJgJCY
	p9BogIn01XoSHBzNI9EoaTwSCEW67ek4LMiICELlk5ReUaiUibcFI87zeiSV4Wt7sSWy
	p+Dw==
X-Gm-Message-State: APjAAAWiND4CNiaKfNfH/Flr3kyYc2jVVWgoFoSeDhVbnZqEgadhgLHq
	AB47obumkVH3Q6z5dt1YLZwBt6CZ98BSLQELnsQfkQ==
X-Received: by 2002:a9d:61c6:: with SMTP id h6mr23206628otk.316.1557270394584; 
	Tue, 07 May 2019 16:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190507081946.19264-1-kraxel@redhat.com>
In-Reply-To: <20190507081946.19264-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 May 2019 00:06:23 +0100
Message-ID: <CAFEAcA_c8pc01K7hyjJHzyjJ1JGCpi_Nf1iSwOt1Q9GwWs-i=Q@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::329
Subject: Re: [Qemu-arm] [PULL 0/8] Vga 20190507 patches
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rz4Y0b4bS4Hs

On Tue, 7 May 2019 at 09:19, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit a6ae23831b05a11880b40f7d58e332c45a6b04f7:
>
>   Merge remote-tracking branch 'remotes/ehabkost/tags/python-next-pull-request' into staging (2019-05-03 15:26:09 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/vga-20190507-pull-request
>
> for you to fetch changes up to 6306cae275c7091aa4e785809d956b475bfedab4:
>
>   i2c-ddc: move it to hw/display (2019-05-07 09:56:10 +0200)
>
> ----------------------------------------------------------------
> vga: bugfixes for qxl, cirrus, ati.
> vga: add "-vga help" support.
> vga: move i2c-ddc to display.
>
> ----------------------------------------------------------------
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM
