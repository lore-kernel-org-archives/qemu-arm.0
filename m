Received: by 10.182.105.169 with SMTP id gn9csp1614251obb;
        Tue, 27 Oct 2015 04:02:38 -0700 (PDT)
X-Received: by 10.68.65.42 with SMTP id u10mr27485330pbs.8.1445943757968;
        Tue, 27 Oct 2015 04:02:37 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x22e.google.com (mail-pa0-x22e.google.com. [2607:f8b0:400e:c03::22e])
        by mx.google.com with ESMTPS id xx1si61046231pbc.232.2015.10.27.04.02.37
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2015 04:02:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22e as permitted sender) client-ip=2607:f8b0:400e:c03::22e;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22e as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by pasz6 with SMTP id z6so219582348pas.2;
        Tue, 27 Oct 2015 04:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=SSI33O1zQ6i11RVgRQB+0n3Fsc4gB4nKBD/Dhd6Kvew=;
        b=Qa/PWS7dTqxOrGpXnHMebk1D4TWloeMt26sRJXfQD0v4I5tacleg0Gko+rrhR7yXnh
         gi/FNiOIZY/w6w1J3DmVGUNdypVXFqWovyle7GaOxcwxCTHtL2IdtB651KzjsEVEWYjj
         odpCkvRkobFDYxx3e28Cu0VfY7U+1ScBZ0yGZ8w7RC5dmONeaUmbExINfveo0FfqpXIe
         p72Y9lWNVkRBfqSfQxgGC7C+zz5coWHjQlBEJUKRe8sYocbv2tNm/rpSOVQdODu7rJaZ
         CyQBlSz4Iw4JUfCjOAQx2nmH1AIpaDEG+yHXEm7QOkbY+cex4jq0K/y4sWUXefp799C+
         iueA==
X-Received: by 10.68.174.1 with SMTP id bo1mr27198607pbc.110.1445943757631;
        Tue, 27 Oct 2015 04:02:37 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id zn9sm39317833pac.48.2015.10.27.04.02.35
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Tue, 27 Oct 2015 04:02:36 -0700 (PDT)
Date: Tue, 27 Oct 2015 12:02:33 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: proposal: new qemu-arm mailing list
Message-ID: <20151027110233.GE18847@toto>
References: <CAFEAcA-s_hSQiLCkQDeX2rR12PcPx5yZ885yZy7C=ZWA5DDbTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-s_hSQiLCkQDeX2rR12PcPx5yZ885yZy7C=ZWA5DDbTw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: Q9tuzkpNn9Ub

On Tue, Oct 27, 2015 at 10:15:32AM +0000, Peter Maydell wrote:
> Hi; it's been suggested to me that it would be helpful to have a
> qemu-arm mailing list, along the lines of the existing qemu-ppc
> and qemu-block lists. The idea would be to get people to cc the
> list with their ARM related patches, so it would mostly act as
> a way for people to filter their mail to separate the ARM stuff
> out from the qemu-devel firehose. (Everything should still be
> cc'd to qemu-devel as well.)
> 
> Any objections/opinions?
>

Sounds good to me!

Best regards,
Edgar 
