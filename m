Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp99337dlj;
        Fri, 10 Jan 2025 04:49:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCURYjiMZ0a9Z0TNnrzRWW8fLwRAWgv90G07Nt+JHMoRKMt3sJ10x0xtW3epNhf4lmYg5iiibxS7Tm4DDA==@linaro.org
X-Received: by 2002:a05:690c:630d:b0:6ee:4bee:d912 with SMTP id 00721157ae682-6f5312422a6mr88179667b3.21.1736513384566;
        Fri, 10 Jan 2025 04:49:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736513384; cv=none;
        d=google.com; s=arc-20240605;
        b=ery/SFmabtVU9W8/+AFkXCqQlPgGWWEz72fZ9laOFZ8SlDTY95eZARg7MATzZ1Khcs
         AoKnmdC6eWC6X6OKqs8266GL8CCsNx8gt09GNXh4Rf7aBM3FsybOW+8OXHd9Uzs3D04I
         /1e1coeNqkF2eVFu0UidtHOfY04FBja/PFs49jYSEKw+7Ion35lepq2zMW6GOVHh2MDN
         eCoQROPpWZG26mQMU2OBYcOt92909GwsFHV5ZhbQSErUnalXabL7EEswPmANEEhJw1Ga
         QJaUsrn8Zdh/V4eQr7WJn0upBt1hHs6JCeDw59xqw6WMrAyxX2+hLl51ys/75xABKs+G
         EHzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w9K8ZwpJGZ8gRKQbrw98qzTEe8mwF8u7FM/xvHIFq8s=;
        fh=UiurNuYzMWkYyB0+N/PNN34u7H1UuW3U5k8vCesFlLU=;
        b=Wm+TmmH/W2yJiRINZTsdv96cDA8tUrWmPIYWKLmesm3NgWo4X1pp6rjVMK49vWx9Nv
         Y81vzhDnc9eYbgFUmZGsimeujSaoWDz/6uid7Rt+baIrSjhVlWN8UzwVXQ+h34T/H6CE
         DX0PWuaa9StCFhjefbnZEkJRPQceG3EEoqSyPOl5/bw0OMc+uhD6uh9Sgn2ReAAF9Go5
         Rcr5TNijz/cWgc1j5uhNwTRGLll8eydkUPV//3eu2l1RS1pdO8r020X4pja+1MgfuuCu
         6ZsEdLypclwJwvGdrQjrMdR9E0oWfWY8BUuomt+kBa6edskdLJ/pQUUVIW/hR8MAuZsl
         xK7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UFmkS5M0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f546c20d27sor23175107b3.9.2025.01.10.04.49.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Jan 2025 04:49:44 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UFmkS5M0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736513384; x=1737118184; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9K8ZwpJGZ8gRKQbrw98qzTEe8mwF8u7FM/xvHIFq8s=;
        b=UFmkS5M0zbjzi0f3UNjfDKHf2Kg8ahkdeJX9IqqtkxancqFa+5GjlU+HgtnyqtRHE0
         q6KwAB1JynE0sltPpJvE+jlioqjlsjjz7hE6yDzMIf6JMt5A4XhCBSnTRN21epfrxYsF
         /twCXO4MqZmLBfnsKxXJypOB/irD1O2kSdIWz/e5Ybj6BPYzOf9VhWmUiOyMRHl9p/ZU
         4ZECxEU+8nJ7aGZc+FqbAgmV5mUO7P2N2jMfLi8JR3jTlyq+1OTVgEKn7Zz+/5SqLg12
         UnGcpHUB+JNYtlBMNqHsxsStGdN1d4rKUWmrJlFBp9kHOVSME32rdd5hdQtoPzhpK1E7
         niNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736513384; x=1737118184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9K8ZwpJGZ8gRKQbrw98qzTEe8mwF8u7FM/xvHIFq8s=;
        b=D+SR3vb2147lU/Byeu16yQWw+DsRn/ymEUwgBFp8wckymMsXKwQy09bteIHC9fK2nw
         kb7VfY2bghGEdxJJCDfVwqwfD31AQR4gMBvwv+wH8AvKrrir4RTpsz3JGG7PwGiQ/i0i
         b7lO+Jlrnvqtcm6x+8+kLU4ty5yKWh7t29eT0jMSZzqalJh3wn2csReRbjaumVXkOO3O
         zs/+GPOjMCan1r5uarejIIYEnLLvP11Vl5x1OHUEcz0kWou8jA4KTpP1Dz3vVmkInmK+
         GJ2/DoB0XefIMN2wL0PWBF+5FUvtYPHtKpcXwlCO7pJQWUvf40QqjU1A/m0lGJniJDl9
         ZZqA==
X-Forwarded-Encrypted: i=1; AJvYcCVm74g/OmME5mDvhZuccs4JflpGtbeOLLAJhRslhDDYH+BBmAZ5ymaeyo5bf9I0wGNHLepTCfrMbULa1Q==@linaro.org
X-Gm-Message-State: AOJu0Yxm7dcv/KkIeG5TzktuxL+iHwJY2KuILQlj2RuxuaBpGdYQfJFW
	EyvOgyyoBFo/T9BFBs5P/FDL697e2HxrsxTeSiwrpRe7iNCzCZ02aI0hYMSk2m8ENO5gvE+IVqI
	gccSx81FZ1sbkkuSBsgCJRR33ORUaj9O4ob+iSIjG
X-Gm-Gg: ASbGnctYhAFLUkT0b63uhwLCbJS1T7Q8PipgtFYW6P+co3/lun9UQs91b+kV5bWu7pn
	PWxV+BhU5Zed2kJnnv7vIjnZ+JZeK5tAzfPK8tKM=
X-Google-Smtp-Source: AGHT+IF1pjlNUYep4xP89lSzVgrWt87SkF0zDi1wFOqOcW+2X4Lh1OGDmi64cAGMyW2xkhGe96Fc8V2IBucdO9D8xvI=
X-Received: by 2002:a05:690c:31a:b0:6ef:7370:96ee with SMTP id
 00721157ae682-6f5312209femr82031427b3.12.1736513384187; Fri, 10 Jan 2025
 04:49:44 -0800 (PST)
MIME-Version: 1.0
References: <20250103172239.18562-1-philmd@linaro.org>
In-Reply-To: <20250103172239.18562-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jan 2025 12:49:32 +0000
X-Gm-Features: AbW1kvY6t4d2AkdiEqXqblyedvgoRObIf1Dq22Vj5m84wOVjSVk-jgM8qbzaxz8
Message-ID: <CAFEAcA-3KSQvuPTBV2Zehq+t==z_nnqk90EY6vL5xasj7NSp0g@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] tests/qtest: Update tests using PL011 UART
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: rVoxeLitA1pF

On Fri, 3 Jan 2025 at 17:22, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> (Series fully reviewed)
>
> Since v6:
> - Corrected ASM comment (Fabiano)
>
> This series split a patch [*] which was previously posted
> too compact in multiple trivial steps. The last patch
> initializes the PL011 Control register, enabling the
> UART and its transmit channel, before using it to send
> the 'T' character in the boot-serial-test.
>
> [*] https://lore.kernel.org/qemu-devel/20240719181041.49545-10-philmd@lin=
aro.org/
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   tests/qtest/boot-serial-test: Improve ASM comments of PL011 tests
>   tests/qtest/boot-serial-test: Reduce for() loop in PL011 tests
>   tests/qtest/boot-serial-test: Reorder pair of instructions in PL011
>     test
>   tests/qtest/boot-serial-test: Initialize PL011 Control register



Applied to target-arm.next, thanks.

-- PMM
