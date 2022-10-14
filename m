Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp561524ejn;
        Fri, 14 Oct 2022 11:02:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6EpeuCCelZXwFwfkB7Jtp3KSxYyuX4WbXUIBz27mFR6MU/BzCe2AuiaAKf1drAArZO4JPd
X-Received: by 2002:a0c:eb87:0:b0:4b1:a7d4:b94c with SMTP id x7-20020a0ceb87000000b004b1a7d4b94cmr5053204qvo.56.1665770552123;
        Fri, 14 Oct 2022 11:02:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665770552; cv=none;
        d=google.com; s=arc-20160816;
        b=zD1YX85alo0Ac9f80g4IfuOWh4Rzq1XIImZXztDRoSV1Vx9v39ltSvA3wvjn5oUPw3
         2ltd4W/McPJ24meLDmrcswF3qYxpFPhTH7dmfTHWyBM3zxXbEw6qHqvwl7uUNmwAOB/f
         mg35kgOFlFvkVCV5Bk4ZsmeJiuZDFrX79PNJYCXEpqTLiGMiz1tiyK7KrvnPK/OWUTgG
         rptN3Ol0ZRC405n22S0tW3d60V7t7ZLWBfF/3+vaodpaIWDv5+00QgW/VYj/J+5stIVG
         TkjtJRLKMZmgiMn0f4Xa76+zwxzXbNmXJDs+crNHeg+g7D22nQ5Rg45OJhi92iCrv3HR
         AMFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=H+p+LhFIEAdK0VxqKGbkg+B7e6WdGPyJ1UPClCrE1rQ=;
        b=NUX22uL4R8LurKvcbf8U/uurI321xFoXW/iuEE/j/tAavlybausJQfS+n8oskW8eSJ
         8zVY4nwNa9excektfVgfJHxJzpajQg8Cln+qH/YPmyxgkYTpI81XZRY7lMqb5bC+rGi7
         JJ3cU+8VwhkK6jSQWyWMXdpKr1BOR1/+njprFMY40+AMZrvh0EX8VP/2f5fLHQeRsvUi
         Yi8QaXm2iOjDozTNa70mbbBWZwsroTllD1jKe6wqqTBmL+S2fKjZqEjlPYGKhGheTZsf
         MRNpxdK9PZDyBSXn5SmuwurmTeWvcRlK0HdrIIDa+D4+zJxUGBt8vcDNOskwa45H/d/h
         mMNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BfWK9Nay;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2-20020a05620a44c200b006d1dcac431esi1848759qkp.362.2022.10.14.11.02.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Oct 2022 11:02:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BfWK9Nay;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ojP0x-0004aP-2L
	for alex.bennee@linaro.org; Fri, 14 Oct 2022 14:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojP0Z-0004Z0-AR
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 14:02:07 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:46739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojP0W-0003Kh-Kd
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 14:02:05 -0400
Received: by mail-pf1-x435.google.com with SMTP id y8so5563897pfp.13
 for <qemu-arm@nongnu.org>; Fri, 14 Oct 2022 11:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H+p+LhFIEAdK0VxqKGbkg+B7e6WdGPyJ1UPClCrE1rQ=;
 b=BfWK9Nay9IMsYHlIxfA/yuqHjWFI2y1MgN7OdXEdE72D3fpqar+pbtdFmo4SB7BJFN
 vhk7nYIbyfHvz1Ozr7lXEBRyfsXGitDiDB0UbH3tTrvWFSOrt6Vq0aJUm5WETJ5RkSPC
 yp25UTfKhdTKQIUFskyE3i2177LbC3BZuCcT6RigAASr1Op6FhgeR+kP7j+qPv0IsAq1
 X0H9mCaY7u3sF4iueKShn2rDzJW44jDESJemtQaypvUlf845/NjFUvNNhVgz3EfD+zgp
 juWBx6QIFdavelm5KHhNl78uuY4YflK/3HsE40z3+p86RhxYx84vhHp/AzTUsJpQ/O9G
 sPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H+p+LhFIEAdK0VxqKGbkg+B7e6WdGPyJ1UPClCrE1rQ=;
 b=lFGKiUF8iMDyxWf1lNWSvXIiRyvTVtvdUej7ehP9UkLRH11p8opto8nRJwxGb8whH7
 uGrbU0JQh/OLM0bWPRHAbu197axre5qAHLIv0iYuM0WmJp93FizFkT4ngoa9GcMi1hUL
 AazushuC3UPjLunduHR4mgcnhsSexYednR73sAfv2O26pCr+boy8ddU5WzwsMxg1zk9b
 Ia3rABEE39rXc9hHDSzKDbORBx2YuppaAxQ31j6FrAhREsgPsd3YrF9BBjOQRxe72dp7
 6BtZ8ud2jOz4YxjrBzrh5vQ2ezTO1eaoK45YtpkUeL6SuejFJzwiW7zbUxQAG/iRePzE
 MzyQ==
X-Gm-Message-State: ACrzQf2tchH63KUpAOPHEbxcK+h87I2iDt5XDAbLeVogbaPtYJjySE4C
 pdkY4UxAHN4rowefkKkc1n6Oo0loIYqaPQCKPohtUQ==
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr5578234pgi.192.1665770522172; Fri, 14
 Oct 2022 11:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <1408f62a2e45665816527d4845ffde650957d5ab.1665051588.git.baruchs-c@neureality.ai>
In-Reply-To: <1408f62a2e45665816527d4845ffde650957d5ab.1665051588.git.baruchs-c@neureality.ai>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Oct 2022 19:01:50 +0100
Message-ID: <CAFEAcA-QoGwuP0Vx1-cb-PnwbO=c2=RyO56RY+ocBt179mRytA@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: fix baud rate calculation
To: Baruch Siach <baruch@tkos.co.il>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZVTtlenK1N14

On Thu, 6 Oct 2022 at 11:20, Baruch Siach <baruch@tkos.co.il> wrote:
>
> The PL011 TRM says that "UARTIBRD = 0 is invalid and UARTFBRD is ignored
> when this is the case". But the code looks at FBRD for the invalid case.
> Fix this.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  hw/char/pl011.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 6e2d7f75095c..c076813423fc 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -176,7 +176,7 @@ static unsigned int pl011_get_baudrate(const PL011State *s)
>  {
>      uint64_t clk;
>
> -    if (s->fbrd == 0) {
> +    if (s->ibrd == 0) {
>          return 0;
>      }

Applied to target-arm.next, thanks. (The only thing we do with the
calculated baud rate is trace it, so the bug wouldn't have had any
bad effects on the guest.)

-- PMM
