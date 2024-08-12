Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp821463njh;
        Mon, 12 Aug 2024 08:27:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2IBvViVq1iVOwNu1q37DeaHj5wB2aEwdvia96XHJZpHZDNr6etX4WjKMR6Wc1wEpwen3WzloJrbzqRZS3JsAeQFJF1/0N
X-Received: by 2002:a05:6512:b29:b0:530:c1fb:51a1 with SMTP id 2adb3069b0e04-53213657cafmr342099e87.17.1723476436538;
        Mon, 12 Aug 2024 08:27:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723476436; cv=none;
        d=google.com; s=arc-20160816;
        b=cWHOGx06FpjPQxNgT3tIItDqXkBkAIKgai1QYBr9DGJFJtlrI0i55T6ES/CE+mf/u0
         fIlOGzOdlbolQMA4e9Gh1pWhrXlMuyYspNyE55aEMfHjKOO6HljVAk4oZnENVDXyeC2x
         xPO0ClaOrbBUPaLVTDTBTVa8tJIPdo7Yb7Ex19Ir93rqZgwSHmUHhjYrQjyeS8DAR6rQ
         s8NtjTNoHjq/BLnDNY2cLfY/ETjeLv9lwSDbR1oHvAdZfPD3gHHng8VaAq/yIhx1hHWC
         s4QSUkPC8h3jyFBwzdrq8ijFohweadRr5MHLPvWA6noyYdqcs1+ui0SL9OZTyFXQrSgZ
         UZUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rXybKHARfQDWEWFNdraxZRcs71tPfZSQTZtSXdxb60Y=;
        fh=i7pWgdAverThNYOKkWS9xqiJQIjSyncr0inPpsZVwOI=;
        b=i6u8LE6iLjDmi3ord7VPqB4rI8P0AGW8Uv7rrd0GrO/3DzJIUWsatuk6NW7ZOSoyTZ
         w2P03H+ejLVwabkGuCqtAdvA2ZpAjGy5wGqenmBHX5w+U9XwJ5LE8BtgSeDXNCqqW49N
         sOp4Mw3fESl8K3xft44xr1YcwXThG9d+k6a8AIB8OAgTwIi6QBpJApD12AmYf8Azka+V
         Ee59Q/ntHxcIv6w6CSm4OqR3E1+jfA+PmQ5Hy0GI9gMJSLvimU0FdxbuKe6RkLoalRym
         AyGUUqAb44dmCKVjAcc59GDoaDfL1CEELnQL2IimyzwiDrY8AXnRr3OS5fIUdgCWL69k
         truQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zKjOkXLB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5bd18bdba67sor780858a12.5.2024.08.12.08.27.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 Aug 2024 08:27:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zKjOkXLB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723476436; x=1724081236; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rXybKHARfQDWEWFNdraxZRcs71tPfZSQTZtSXdxb60Y=;
        b=zKjOkXLB1MthKE+andNrdXe2yYbAEP6whUh/yGyvabVmcU9NDbraQpBzg6pq0Yc0gi
         YloJAozIT0pdZgtE+H+Aoar3BpHNQQQLrhTqnHwChNE7jA0yQYQZ5IGgYA6Zws7qJWbF
         A6DQ4flQLBb1WHI0fWmhpA6QbxTyDvs9hzPCjfMVgxH/6V1Mi1WbENri1UOeFamHfMP6
         V9iOxNKYZ4kJy5TY9R7eFXks3JCi8ZxFJuRvfGThXEhTG29aFvAD8lKjXjCK8s4tq8y1
         uOPa+hoDIkOu6z+71FC68dxUUa+r9z4i09LZSBX0EyUqN4FtC07UBmgmGlhOvfEpPM9X
         0a7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723476436; x=1724081236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXybKHARfQDWEWFNdraxZRcs71tPfZSQTZtSXdxb60Y=;
        b=ZwMcMEKBnbBZ4CDzJnK2WDdob5L27OyEr9NroCIMkcNfDi4xMlN7f4e4UlFUgNpruI
         n1FNQ33kAQvbAh0MjhTpevnIMVOcPnEpp7PW8/mX6GMGV88xuE+53H2cw7aAakIlXBxJ
         Vcy7Nh6MwuPZCFmAPxJ4Shs2Cox85NATSww9VYATuacZtnN+LW6APVPpGupOaILZtq3P
         ybybJum1DTQKnvICQiQ59xnEmwY15Zol2jb2eE/ZhPa9Hr5Q4R+X4XtXyKC/YWfJn937
         3AfqofpjAL56UPCqSA6WZS06d7Lb7Q71WsRTEYG2EU5DQMTqOHNCk6I6hzvH+O29A1Xu
         7lkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmABbiGmsYRngfMO2JfO2SEBHWaDn4xss9/Gyqg7qlqGRh6qCJeDdyBSTbX7PYz8BHTg9xEyn8twtj6XUPVG/FraqBqayl
X-Gm-Message-State: AOJu0Yy3bb18KE1Hf8ey8EDG39RM3k5LWnpnsKaTKtmsez1Fsss3iNQs
	e7Pd020EPGhyHNPsMQiwNVk/yNG6IOz6mltoFLpgC8iMdu04ipdCjWIzAc4gYrG907Z7wRHs4Pp
	z+0zFs+fIIcFssH0VIx8k7HUe+Rr3YX55WYnlevFN
X-Google-Smtp-Source: AGHT+IEeVe5yhkoJJz3nU3VAeKWOdOhMHqBxuZRyy5yobEKnlXsreTjzSBYW80uQd548cXGqNogyUAGIe3FuaGJTldg=
X-Received: by 2002:a05:6402:26c7:b0:5a3:3062:36c7 with SMTP id
 4fb4d7f45d1cf-5bd44c0e442mr559593a12.7.1723476435835; Mon, 12 Aug 2024
 08:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com> <20240805201719.2345596-4-tavip@google.com>
In-Reply-To: <20240805201719.2345596-4-tavip@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Aug 2024 16:27:04 +0100
Message-ID: <CAFEAcA82c_RZ6512dB1OxpAtinRctkZK7ZyjpxX16Wk7DYZDPg@mail.gmail.com>
Subject: Re: [RFC PATCH 03/23] scripts: add script to generate C header files
 from SVD XML files
To: Octavian Purdila <tavip@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com, 
	pbonzini@redhat.com, alex.bennee@linaro.org, thuth@redhat.com, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: Zh1yqIVHhnY0

On Mon, 5 Aug 2024 at 21:17, Octavian Purdila <tavip@google.com> wrote:
>
> From: Stefan Stanacar <stefanst@google.com>
>
> From: Stefan Stanacar <stefanst@google.com>
>
> The CMSIS System View Description format(CMSIS-SVD) is an XML based
> description of Arm Cortex-M microcontrollers provided and maintained
> by sillicon vendors. It includes details such as peripherals registers
> (down to bitfields), peripheral register block addresses, reset
> values, etc.
>
> This script uses this information to create header files that makes it
> easier to emulate peripherals.
>
> The script can be used to create either peripheral specific headers or
> board / system specific information. The script generated headers are
> similar to the SVDConv utility.
>
> Peripheral specific headers contains information such as register
> layout, register names and reset values for registers:
>
>   typedef struct {
>     ...
>     union {
>       uint32_t PSELID;              /* 0x00000FF8 Peripheral Select and
>                                      * Flexcomm module ID */
>       struct {
>         uint32_t PERSEL : 3;        /* [2..0] Peripheral Select */
>         uint32_t LOCK : 1;          /* [3..3] Lock the peripheral select */
>         uint32_t USARTPRESENT : 1;  /* [4..4] USART present indicator */
>         uint32_t SPIPRESENT : 1;    /* [5..5] SPI present indicator */
>         uint32_t I2CPRESENT : 1;    /* [6..6] I2C present indicator */
>         uint32_t I2SPRESENT : 1;    /* [7..7] I2S Present */
>         uint32_t : 4;
>         uint32_t ID : 20;           /* [31..12] Flexcomm ID */
>       } PSELID_b;
>     };

Bitfield layout in C isn't portable, so don't generate this kind
of union-of-a-integer-and-some-bitfields, please. You can
generate FIELD() macro invocations (see include/hw/registerfields.h)
which define shift/mask/length macros that can be used with
FIELD_EX*/FIELD_DP* to do extract/deposit operations.

>     ...
>   } FLEXCOMM_Type;                  /* Size = 4096 (0x1000) */
>
>   #define FLEXCOMM_PSELID_PERSEL_Pos (0UL)
>   #define FLEXCOMM_PSELID_PERSEL_Msk (0x7UL)
>   #define FLEXCOMM_PSELID_LOCK_Pos (3UL)
>   #define FLEXCOMM_PSELID_LOCK_Msk (0x8UL)
>   ...
>
>   typedef enum {                /* FLEXCOMM_PSELID_LOCK */
>     /* Peripheral select can be changed by software. */
>     FLEXCOMM_PSELID_LOCK_UNLOCKED = 0,
>     /* Peripheral select is locked and cannot be changed until this
>      * Flexcomm module or the entire device is reset. */
>     FLEXCOMM_PSELID_LOCK_LOCKED = 1,
>   } FLEXCOMM_PSELID_LOCK_Enum;
>   ...
>
>   #define FLEXCOMM_REGISTER_NAMES_ARRAY(_name) \
>     const char *_name[sizeof(FLEXCOMM_Type)] = { \
>         [4088 ... 4091] = "PSELID", \
>         [4092 ... 4095] = "PID", \
>     }
>
> Board specific headers contains information about peripheral base
> register addresses.

thanks
-- PMM
