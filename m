Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp632268dlb;
        Wed, 7 Aug 2024 16:57:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwH/t4VIi4pI2sebSEiniJVZT3DE9C3whNnB064yX7tvdAPzzqwWuT6YZ//XNYLhImvapzM7ent20hBb2MbBrUZoFK2NAB
X-Received: by 2002:a05:600c:1394:b0:426:67f0:b4fa with SMTP id 5b1f17b1804b1-4290aee06c1mr1816245e9.1.1723075043442;
        Wed, 07 Aug 2024 16:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723075043; cv=none;
        d=google.com; s=arc-20160816;
        b=PWIi0W2RkzjGWjnL+foAU6gWvWJliF0qtns/ckEGQE3RBEoTA53nuZ1+r7d8PBtcJu
         zarxtXFsWYTE0mpndhmFWfLQktWckC2nd0AQg/ZMODMHBXaiS4w701IMBgykXdXSCNDr
         uu+O15iHlQfzDVPaWtn1PUj41NbCDILrwaQBFR254rjeNlBW4lNVP3A+GRXnWbH/gSJS
         O8jU+B6MCLqKPsK4PyXFRelhyBJCPMZOgQb4zcKz8vzOt0GgJ51WQvzgDByaYpH5k9SV
         WFR0HEhmhsy6FnKWtrZmBxOrAYF+hh4jgbzXtzAR1t0l70YGFqVi+wM8GMI2n+mxUgEC
         n1UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xjmFqe72YdvfqIFt4uaBezk9cBCdMQ8uK+a6z9kJlDY=;
        fh=ge5GpUEk3ewdjYtWZwS/jAhybjK8sV2EGIVMmSIzT/g=;
        b=hWGx1umrnFsAXpP4mck43WBNyMp+zYaPhMG7fR4o8UW53LxTzgZ+knDGJKq2XS5oYy
         PCEioBtaGt7sJXjxSTHzc+QuS1GCXbckRS2dr/bi/ws60WxiJjyPuO8pjou24HXp0DsX
         ljCict5GDIf4Z/GY1ziSyIOYeTNjwFkqdm2gJD5vtbG4/7Mxou/f8JTPa8HOPz8kaR0u
         cZ8cPg8cw7VsL7XKuHaktqSozYbPVFIFcpM6lM4Y/wO2DSWqbfCVZmbb/DYg0qxH7UVJ
         dT313bnhr33Cmr8/+G9Xa7Qyy9U5pTvqmq0xzjtz91RD57xpexl3MIQ6q9gixFocGVTe
         +aGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=o4t1ChK1;
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <tavip@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-429056318d7sor5988815e9.0.2024.08.07.16.57.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 Aug 2024 16:57:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=o4t1ChK1;
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723075043; x=1723679843; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjmFqe72YdvfqIFt4uaBezk9cBCdMQ8uK+a6z9kJlDY=;
        b=o4t1ChK1ylqBAMsvGrUSW4B9c2Vf2IQc0s+8gELzyxhDida8NDSVZAGLtcy2FmNF7W
         V0Htshkb7syS8Wd6iS8XmNijJtLO3zksVIm/Z3kB+Bj6BiBzm5D/2gRWW3N/N7xzqvQs
         ot36mHXdwasbqNdzRXlR/V8+5AcuLxvNMXtrJfjHVOPnT/vnb3K104/N9lFEgfqYlQB6
         KSTqrri9gVCbLsv0dFWIJLXZJfXvRqnakBElsqiYUyFEnqQA1hi3z4+1R4rcIfqxS97z
         BNFUXy/oSj6s27ZLFhl2eKxIT0Uc5B84lMJH7+smo5CuLTNwfHx7yEdzmBVzOzPpCgVK
         4BBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723075043; x=1723679843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjmFqe72YdvfqIFt4uaBezk9cBCdMQ8uK+a6z9kJlDY=;
        b=GEA/Jyp2hnwrJDw5fphBMTde+VPJeSxdywyZ12W2tTalucl6h+ciM/EtE8DqRO8Jnp
         K++aE12TFxHxLstry+AvHYrzTx0szuEMUp+wbn9j3h/TOEfwrqJ9tcTNlj+dIsEnWElN
         NePTg7+fxTIyNYqP+lsxFN8BTWRqAdM4qXsEHaPVODZVO2KwDX+X4aGgWTPxxnmAibSU
         RXvFxGBUSn4yXDLZZsZbJl3Zc+T3Q6tho0S4rJ8hNqGw0l1wdozNpIca2CPl2KyMEUTK
         LrHjvS1ZSVwCN+k2SsxxEldZIc0JA4s7y6yTkuH9zuQOk97H59D7TcHdsKgi3ptD8GSK
         p8DA==
X-Forwarded-Encrypted: i=1; AJvYcCUxmgEspRcIBLwgNpVEao6/fgjlLonxBhttc4Fpy+VLw1izkKq9OWiHdYi/fNTiQLZYWFr0o/v8WC9eCsz+yZdSpvMUrVRG
X-Gm-Message-State: AOJu0YwE+deKg+PsNK/nj8ZpvPNkT0XuqdWYQTiDpOnyY0MqqZCce6sO
	4zkpS40OaGR/3RtQlpSspJ8FCtXHpnzhO+CAToy6caQd+d5gXVJWeTDa1z6N5o/tzc2kBfH/5OJ
	QUuPzaZGVY+456VUIkgvd0g5HwZDhbJUyg6nG
X-Google-Smtp-Source: AGHT+IFv2cxTvpXCT+49NkRd97zHBHted2CkY5x40KNi6RQ0dDUdJEnI2MaMNyE+sAvAT7rdeUDrltASTg+VIbso40I=
X-Received: by 2002:a5d:4649:0:b0:368:557a:c64d with SMTP id
 ffacd0b85a97d-36d273c5c0emr96170f8f.9.1723075042625; Wed, 07 Aug 2024
 16:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com> <20240805201719.2345596-23-tavip@google.com>
 <a37a5291-5917-45e6-8697-08defb97ac29@linaro.org>
In-Reply-To: <a37a5291-5917-45e6-8697-08defb97ac29@linaro.org>
From: Octavian Purdila <tavip@google.com>
Date: Wed, 7 Aug 2024 16:57:11 -0700
Message-ID: <CAGWr4cRcQhQw-5QFga3-KDbBby_3mW-p2wKSd4iy7xHzw3-boQ@mail.gmail.com>
Subject: Re: [RFC PATCH 22/23] hw/arm: add basic support for the RT500 SoC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com, 
	pbonzini@redhat.com, alex.bennee@linaro.org, thuth@redhat.com, 
	peter.maydell@linaro.org, marcandre.lureau@redhat.com, alistair@alistair23.me, 
	berrange@redhat.com, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 9ahGOMFOkJUI

On Tue, Aug 6, 2024 at 7:51=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> Hi Octavian,
>
> Few comments inlined.
>

Hi Philippe,

Thank you for the review!

I have queued fixes for all of the patches in the set where
applicable, I'll wait for more feedback on the rest of the patches
before sending v2.
