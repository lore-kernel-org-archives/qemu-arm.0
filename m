Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp586927njh;
        Thu, 29 May 2025 09:12:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrQ8BMkpTGQBSqxE/BTY/Oc0IjG/+MpfcgLaxWEc0IMEjLufkiEMNOkC6Za+WJoso03TXgZ+IUmQBMHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGgMvaRUpO9zI3P4SR8TnJoz4QdHxFLqCN2hJoCNtgaMuoEc2qAdlibgS5Nm7JCGLOqLXy7
X-Received: by 2002:a05:6000:2409:b0:3a4:e4ee:4ca9 with SMTP id ffacd0b85a97d-3a4e9449a7amr6374282f8f.23.1748535128279;
        Thu, 29 May 2025 09:12:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748535128; cv=none;
        d=google.com; s=arc-20240605;
        b=XpRUpWwjLi9ozhM6G3wtZNb+fcCl3KcNytoXDxQ2XSj2yyYuDwpFxq2CL4ISdBEF1H
         PllpKMeugCA6fI8abTBMXAyWJoZEDqFsG3ggNKXkjlQ5MXz1Wx+HsWAV0Qyd2htUYRr/
         +h0LbgeF2leOBT35wbqov/tzuKmH32u5iW1CmEO8s5eVlFaYzdIJKp1j70RUJEVp8PDR
         Oh34aQpZBlb3xiZsp9dKVmgE6+5tpBSQWnjjMKVHltkj5l9gZYyfnun4Gn6/VUTvkLZ2
         hvgsTHBd+guzBZF8mTB/oNsi6khwcGem8e8vh0C/TXiX1R8lq4BiEqyHe4xlnXKDa9Lx
         Vc0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+mel1eN+tm8poZ5dlpP/RdF9Erss8TOllz28gw93WIY=;
        fh=wasvv0eGVZBy3gZNxaXj31ITBGw/CpGxqjprmPadPm0=;
        b=OZ+LHMZ5lILxYc0atOE45pClyXEa+hxj/Qcy41hQ7UVj50s6Ugycv8QHSzaDLvLZNH
         OytMS7Fh+JNssEQRwjOyghIfa9yq87AQQEupAboJGpBLrnNjmpBkNQFKdKejNGTw0pSz
         qMp7ghpceMti5Ik6m6pbJXAQHtslMYOHnoOKXNJHxh1olrrfxAR+c8bX+Bm6v5wcQfm1
         LvjMNXsAM53+yc65NNv/YVuSRV6ps07w3js1AKMWrntzpgbPJQfayzUgNG9aYaT/8FA2
         fwKGCFtDwkQuOza8cnuiiygXpvXxwK+gvsU8LT5y6vd/IUg3nLRhSLJZHvcLLAJlANx0
         C2hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aeAst65W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a4f008bda5si1299318f8f.605.2025.05.29.09.12.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 May 2025 09:12:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aeAst65W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uKfrJ-0005HL-Up; Thu, 29 May 2025 12:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uKfrI-0005Gd-6C
 for qemu-arm@nongnu.org; Thu, 29 May 2025 12:11:56 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uKfrG-0002j3-Q6
 for qemu-arm@nongnu.org; Thu, 29 May 2025 12:11:55 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-70e3e0415a7so11054797b3.0
 for <qemu-arm@nongnu.org>; Thu, 29 May 2025 09:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748535113; x=1749139913; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+mel1eN+tm8poZ5dlpP/RdF9Erss8TOllz28gw93WIY=;
 b=aeAst65WrlGF36xFQkSth5kZUxoQ5WS0bpofWJnKn+W+0gM5nGVBQ1LyuKpSsM0hMD
 CC8YSGNyfz87w46yfeoo+u3iDgNlDa/gidGqfmEcy2b1uEg6jx7VJBZdQ2Hx6D8FIPyq
 UXdcMiipmnFoGxdZs19XSHl6y1PCvrYRFdDoHMv7XWUlbiWHp33EkzFLENuyxTv3lgEm
 0mcI6OqESaIQhDHpdrgfiFfg9pbk5C46Gq5NkciVPW5ufpoEoEdthSqbE9uew8eCX49S
 wXyToNsy25Ap7YveCjYy1tLPtfqwlWPhopf91V0sE+vsBSP56iGvtzDDU96DUnVsB0Il
 P+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748535113; x=1749139913;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+mel1eN+tm8poZ5dlpP/RdF9Erss8TOllz28gw93WIY=;
 b=NN8LDqJ1MzckOBkJajKMjo2jWwjIbHHwedpBNnyQZUFYIF0V3SXbSDzwaqavcb01Zy
 U9TKmWuIW9quCom2XCdefSfSPnFnBzrvemJxkLQ3G3jZ6htqvEEA/w18j0bBIpZ7jUOw
 7ylWr9rZs10qaCpcimRT7SBt32K42Pg231vylTjQrpZG7GMEmU9Ki4Q6MYIqJUsUSrnN
 UjFmLqejGtlzKvkKsVVFZhNLjys3eFHA5/FUA4yyCW8TingV2KZLsSMeNw0pf4i6p9eo
 ewc7BCBP7tczCD8C8Zj6Rwsmt1JAV2MPUZ3FFmTlQbZWCSMUKd+jZYp5aBgBFw6IuTRt
 W3yA==
X-Gm-Message-State: AOJu0Ywj1gO8axp+tQ/RRoixhD2ilOcMh1OIdlddMqWBbji0iHJDZnMp
 PUxh6n/1RtySGc0RF17NTadv4vxNBh6OzznamOZjYKu7Qth9JhwTdBiEYTx4z+FP8YI4nY8hK9L
 05J/sdpaT4fdBZtM1/NFZTncU+TF2uSDemGHZU1CbWw==
X-Gm-Gg: ASbGnctgI19ZSu5RmNgmJgzdGtkOK5wloU+b/H9Nr8OcbxXYF2c2yd5RehL4iglrl+7
 /lOLMcTUC46Y18A0RWuC337KG0RktgPczxE5JW4gXbh6DP5Qc0Vo3xsF/D7b39UMyv+v7tKPZ4X
 7oI6zWYONKwIqYKWIMOI55BV2LjdRL+Qy6VA==
X-Received: by 2002:a05:690c:6403:b0:70e:7158:6fda with SMTP id
 00721157ae682-70f877a3b54mr70879897b3.9.1748535113595; Thu, 29 May 2025
 09:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250519170242.520805-1-thuth@redhat.com>
In-Reply-To: <20250519170242.520805-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 May 2025 17:11:41 +0100
X-Gm-Features: AX0GCFul07BWFixlJlKTdh5b25Rd47Gx0rGyLrnsCOW2cDgehhk5PtEtFmQU9Ag
Message-ID: <CAFEAcA8hYOpx+Nxp=ZN2hprb1rPujc54Hh0X7iSn8-30rkn_=g@mail.gmail.com>
Subject: Re: [PATCH] tests/functional: Add a test for the Stellaris arm
 machines
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uTxv9/wov/ms

On Mon, 19 May 2025 at 18:02, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> The 2023 edition of the QEMU advent calendar featured an image
> that we can use to test whether the lm3s6965evb machine is basically
> still working.
>
> And for the lm3s811evb there is a small test kernel on github
> which can be used to check its UART.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
