Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1827994lfp;
        Thu, 6 Feb 2020 11:21:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqw/biVxzzYSHcyvL20P7cS/wcOpTpMgPLG3/3FXM3y2+3oTMXBUUwoft/WUp90sDsXFDhHR
X-Received: by 2002:ac8:67d2:: with SMTP id r18mr4162053qtp.34.1581016906549;
        Thu, 06 Feb 2020 11:21:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581016906; cv=none;
        d=google.com; s=arc-20160816;
        b=AionjYZO/Nmr3CiV4H9QFYreq0JBsiIYsMDRxGG4E+TnH0mcOqsoPU2yDxDmM066LJ
         W4oGFceRtJCyLx1dUtiw1eeXTZy+r2IynnVCgMTUnLCLinxww+cvEil5rKZRAVaPYfLS
         aEpMcBiBV0iD01uAmzJXm9XSqVULLf99KFJtzAZqp5UtfCbPQAkHnZtWbq2ee++JR8Nt
         sdT2bIhUj385nbVJxZZJrA+hCL08YjrAp5xu8k4kzoXE1cGsiAcJp9CvuoSPLvxBEGE6
         YOEThxuiafuu9KkJxvXbQQCCeK3mXd/GAqGtCfZ/5P/Ja/zpxEYkOQA0C4KRYSaXVk71
         DsCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wPL42b87VCI/+qQKxTl/o9MCUbTyNtSYETJDflkX/Tk=;
        b=VOyNWprUkl8oG+N1w1DGZnzB9DER0i15kBE2eX3Zvi0cNzSTqOmXX281EUYwlpppjM
         C5IiKOnWU0Bor/K++hdEu4cF4sEK1VR4jFCotSP1IhwI38z+9M/cfaZNsv1xQEiswiP5
         j79U5bDkYthFNhU74WxMj5rLHlzUq3amasU06RjeUHlfg/A5vyCh+z4GFBTKAsqtl+Oh
         H6eCmNfTGC0AAU1L5OIlykUdf4+DzD/D18af+d8ZWHTQ0tXpBvkSUIRb/VHNw80f+I10
         xUiBCAJAAypugrvlXzgtxiXDiaLa3rI4JhPdjrym8zRYE558R6KPw+By4O1ro01Q1izr
         KgtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DXRAd/Wh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20si221952qtu.93.2020.02.06.11.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 11:21:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DXRAd/Wh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izmig-0004Js-0j
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 14:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52166)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1izmiZ-0004JZ-DW
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 14:21:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1izmiY-0001jt-1t
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 14:21:39 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:38899)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1izmiX-0001ek-SR
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 14:21:37 -0500
Received: by mail-ot1-x334.google.com with SMTP id z9so6610425oth.5
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2020 11:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wPL42b87VCI/+qQKxTl/o9MCUbTyNtSYETJDflkX/Tk=;
 b=DXRAd/WhuCTXB22aXEp1uKI0khIq4aDzEQAyXx9JyVXlzEDTYFSa5W0topFLOUmE9w
 hNpbx3Jdxn+AacAEn5qY/LNbe0BSA7O2Ev4S412tGYE/f3+Ww105hmOReUOPMMbdvtr6
 xzrw3Fyz2zSFBoX389gcv3ONmrZTqH9dOtJu49KwJkuTLZ80ilW0TpYvotjVLgauwPrr
 F6F7jcPRiL5dLwKK+TZ+2KdBbT9E9QxTWQGrdNoEWZX8jkrENUL1vXkrG+wpX+N4MuUr
 IGbdWc1bylT0U/cmII1UDmG7a7EeuQrHYdlj9VzL4zEo02sNLSs1hlwz8eK+UwOsBDIj
 DLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wPL42b87VCI/+qQKxTl/o9MCUbTyNtSYETJDflkX/Tk=;
 b=DNJHuZ4GUQxL3Ir0wpUrHDOLS46gDvDLR+iQmRKQoNuhspBVwpLLBDMkaOFT6hcnPL
 5jzF4p41tlEiFHCR4tKHe1XD855XHsp6sWSuGVHvmkKmypM6cvfaSEBmcGfSXxClmmeo
 U6e+gsMk25w764ZzKeIfDYI5sa4x2ZV8qDKiQoO7xxxhHocseYQkWDCXdQ2296SdKybX
 rNFUmP/l1TcCJneWQ439pcxLkzQhw7YUOlvr+NaQ4n35C6tfWF405bjlDKF+OqVsxWMa
 H26aCge55rmeCBd0t9HIIwjsPSnVVxyKlRte/TKQH9/7muphz+o6SG3Ltd9Ht/IiA1tQ
 sZeg==
X-Gm-Message-State: APjAAAWNwJBs59frxW+tp0R0GEsTAYvi7s6/Z3kVFs5h/BRq/2eFuMQz
 zpR8IosoRT6BwpEhLBgtn5LF7FBEq/DoR/CrjB2Q5w==
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr31813283otq.135.1581016896774; 
 Thu, 06 Feb 2020 11:21:36 -0800 (PST)
MIME-Version: 1.0
References: <CAC41xo2pUsuzOBAG2fFwYiF8cK=cN+0pZYY+-2GTxamhxSw1gA@mail.gmail.com>
 <CAFEAcA_JnpOAH-aas82YsQ2UsHC7WLxVSMd+Tr1R7aqkwCdW7w@mail.gmail.com>
 <CAC41xo1HWW+mTYtsDyb9BkEe6nVffde1b0DVte4pCYHAn3oLUA@mail.gmail.com>
In-Reply-To: <CAC41xo1HWW+mTYtsDyb9BkEe6nVffde1b0DVte4pCYHAn3oLUA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2020 19:21:25 +0000
Message-ID: <CAFEAcA-hr+DvbXSjW9xTuTU1WyRYoUh5gML=CLEc0nW7YyxHkA@mail.gmail.com>
Subject: Re: gicv2 virtual interface alias base address
To: Jose Martins <josemartins90@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::334
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dtLtSY1x/5Ag

On Thu, 6 Feb 2020 at 19:05, Jose Martins <josemartins90@gmail.com> wrote:
>
> Thank you for the clarification Peter. From what I gather from your
> explanation, the functionality might be present in the GIC IP but the
> SoC designer might choose not to actually expose it in the platform
> memory map. But do you see any specific reason why an SoC designer
> might do this? Also, in the case of the virt board, and since support
> for this is present in other qemu platforms, is there a specific
> reason not to include it?

The virt board doesn't include it largely because that board
is primarily designed to run Linux guests, and Linux does not
use that aspect of GICv2 functionality.

(The GICv3 and later do not provide this kind of cross-CPU
access functionality at all, so software design that relies
on it is restricting itself to a subset of hardware that's
rapidly aging out of existence.)

thanks
-- PMM
