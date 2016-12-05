Received: by 10.25.159.131 with SMTP id i125csp1681620lfe;
        Mon, 5 Dec 2016 10:00:28 -0800 (PST)
X-Received: by 10.159.55.168 with SMTP id q37mr45471210uaq.63.1480960828036;
        Mon, 05 Dec 2016 10:00:28 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22f.google.com (mail-vk0-x22f.google.com. [2607:f8b0:400c:c05::22f])
        by mx.google.com with ESMTPS id p188si3775696vkp.59.2016.12.05.10.00.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2016 10:00:28 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22f as permitted sender) client-ip=2607:f8b0:400c:c05::22f;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22f as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-vk0-x22f.google.com with SMTP id p9so182898091vkd.3
        for <alex.bennee@linaro.org>; Mon, 05 Dec 2016 10:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=CrsC+GwLGxcepf61XsW04iyrGnqjNcb73mt2ILBNNhw=;
        b=SqVh9GeNwKx2YNQVhOSuFreSxBOAbR/rNFvayEROe6JXGVlpBxSbwT7TtdVcLXbguf
         Lf67aXG/EVchotDQGLIsfjFLDU43A79Gr8z21vXspnC5U1RHGuH7piKMiKDEZR8M7Vii
         zMFQybOpcWAay5seKLxm7WW7ekHuRHLPZhmL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=CrsC+GwLGxcepf61XsW04iyrGnqjNcb73mt2ILBNNhw=;
        b=A3pBag6fjCJ5BdDbV8Wi7dV8XzjAYog5MLWGXRXAFn1eelRyr+R9Vgs5oyO9D9pED4
         478d+cfClbMaa339uiff8khHwannDUvSYczJ8wRIvhw0bu9O9/N1/yluOKCF4iUsGFf6
         8Q1FBLWhCO28SEey3ljRg5MJR8oSU1KB1NefpsWmh0d0s/azzadRddd7K+DgBnoyGfJO
         rJbH9EKY3rmTmU7fy9FW9hpoK8d8BsBJgUlN56tyWc7fdTAnnd34XK+oao6+1jGa+8hy
         r4jLAhO1jwwO0fPSkKlWILVwm/Ru9uuqM6w5b9ReI4TV7/q7A3pwgcSdcHubephZduRP
         0K+g==
X-Gm-Message-State: AKaTC03KQYTy9tdTF/0IzjiFBTtrDifi8MYgHpm6ji0bgZR9wU7Crl9WkV0YP7zfemVznQr2tluxP7shjQqJcZv5vgw=
X-Received: by 10.31.75.198 with SMTP id y189mr18342117vka.51.1480960827717;
 Mon, 05 Dec 2016 10:00:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Mon, 5 Dec 2016 10:00:07 -0800 (PST)
In-Reply-To: <0bde5bb4-091e-e250-b283-5f1faf8e4351@twiddle.net>
References: <20161202173454.19179-1-alex.bennee@linaro.org>
 <8737i21vl8.fsf@linaro.org> <0bde5bb4-091e-e250-b283-5f1faf8e4351@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Dec 2016 18:00:07 +0000
Message-ID: <CAFEAcA-Hx1kWZr1Li2=qdULMBdYyA9pa3cZ=hKPM9d-AqVvv4g@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH for-2.8] target-arm/translate-a64: fix gen_load_exclusive
To: Richard Henderson <rth@twiddle.net>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Emilio G. Cota" <cota@braap.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: avEZ+3c0Yq5r

On 5 December 2016 at 17:22, Richard Henderson <rth@twiddle.net> wrote:
> Acked-by: Richard Henderson <rth@twiddle.net>

Thanks. I've put this into a one-patch pullrequest which I've just
sent out and which will hopefully make -rc3.

thanks
-- PMM
