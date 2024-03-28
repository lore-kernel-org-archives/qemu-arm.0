Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1271113ejv;
        Thu, 28 Mar 2024 10:00:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUQrFayiujSMUwaLYSBV/6naC5O0q6Nf5nf5v9EYh0cvN/vS5jjghS5EpK+kTrOU1mh2Gc+rPHldnF+1/mGToqLsjkoOt/q
X-Google-Smtp-Source: AGHT+IFk8hMJqM1iVRYk4HFS7YdtfNumYuCtNY8Dv4D1jYN6eR+rP6ZAKFq+OGsS/QYSFCIgB2ox
X-Received: by 2002:a05:6808:17a5:b0:3c3:d6d6:d40 with SMTP id bg37-20020a05680817a500b003c3d6d60d40mr4212096oib.43.1711645246911;
        Thu, 28 Mar 2024 10:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711645246; cv=none;
        d=google.com; s=arc-20160816;
        b=H8AizjLFhAANDK/9Z7pQYcXWB5nK+r82K0HoXS719WTQF1Irbj9R7FzluAVH/9Z+Xx
         tKTuwrWMc185sOf+KXI9KQXigo7F/0Xg3rbUTMYctsrfZE8OQ1LWf+IodJYCyhptAfNX
         aHbKcKXnOpJ2OG59K84qdhfBNUbYV0ElVFpN8oXDVfG9tMbi1LoTq4HWLP+Y0LnX7fVz
         zRiX0VlrOCUoZcwq0tRTmL/Aq9hQVLYepxARNW7+gB/WRXikIJD0JebfiFPEXF4dK/zK
         xP/Kiyeh4QXrfpK5Aih+d2eHAGVMrSiGyd3xBna9oUnRhVQuBjNrxeZRw1slv0/RD9m8
         0qGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4d9qK/KHNG2a5Kl+d0D1I4QoIBsfySbEwohNRhMRaW0=;
        fh=HZ6XAc4nji+3om+ujwdWoG3+08Vr7QJ8v7bCcFWKJzI=;
        b=WwSVb6FgDH1iaAiTa7VplPDX9c/DCpZJvc61nOBUX+ddhjExMraBYfoe5pkW0/QSUA
         ZIENIlQy9m/d94LHyEfQLF9UUsvMVjRDtPNnQ5IaD7AOB8Q44rZxBj5IfCfG58vfFE4c
         OEaV2LcM4Cx2BYjcYntDq+y1nUVY6Tz5bsImxkhE0HgJ/9o8iFfBfG3uwjC4QrBVVXUJ
         NvbYQmC8bC+p6kA2Fp4HRCZYINr3Nu8tqGoTh7TQmuAMtXnBs7GmyqRFP2c1WJU9iXHK
         AZ9HVsTszmsEQ07c++Cv4liALSfJ/U9gzFUI8SdCQDTiSrKnTpI0azlh0laTke60ST6j
         16yg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AB4+dNXr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12-20020ac85d4c000000b004311edc9d82si1825880qtx.767.2024.03.28.10.00.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 10:00:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AB4+dNXr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rpt6m-00070W-AF; Thu, 28 Mar 2024 13:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpt6h-0006wK-O2
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 13:00:04 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpt6f-0006yM-PY
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 13:00:03 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56c0d1bddc1so1432831a12.3
 for <qemu-arm@nongnu.org>; Thu, 28 Mar 2024 10:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711645199; x=1712249999; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4d9qK/KHNG2a5Kl+d0D1I4QoIBsfySbEwohNRhMRaW0=;
 b=AB4+dNXrajH3yHrsM9qBDBSxjqdTidUuyOvHu3n24gFUVwGn1js4QhEvkuoHmxFXsn
 BS7iudKDMLdSZ7ZqkYpm+I2ejfIpBeCM+VMoL1aBJ6boEc8lj3Zf6WQGfX8WSKve2Q6x
 MO+hhc9JDh1oKt3FGaQkwPoKECBq9aNQDVoMo6gb7Ci9j5H1+6Q8MoPttNKPoaDW6yyK
 f9VtxAS+kTrr5zS1q8UCFnX5EcawJ6HELNb6wFfglddPZgn1D2by5p02F/kZGISVKr/X
 CAbfVH9FvUrrmrg72sBae8BqqxfiXz/82heppeQtAZG4sCME6IqVhpcshNpvZ1Pnb6Y7
 9oGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711645199; x=1712249999;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4d9qK/KHNG2a5Kl+d0D1I4QoIBsfySbEwohNRhMRaW0=;
 b=C0r60ZJRBS8ZQvePC4cfg8iTCGnrZzNqnXTs8HqOVHGdvJCrtwpeLYhZv1OMvk8jv/
 tQWbb+Q5zpXf0r/YMky1kRdmSjsFQFO553vm0ohfMhZZv8hY9IpBWdjO7HKKiRKB0NXi
 CZQG0HujckZHBZMi/pnVyIKfhwWsjfD0NKK7jVOlo1hkdjbYmNnTn2LQto0AHbmiN1GM
 tDjH8NzgZ2AaJkMUk30WYxikBCkOxDKEkmeZtwR9rFWBd3pyF1iiaHIY3QS0nhcGPJrO
 hnlS4ACSvhJed5A4oVl1W+mpI4tKKEe49zovexcDIcpzd9cMHNl+R5mcvXo4gI/W8Luz
 IZSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvkFuQREN2qSkLtTqMWV0zS9/qUZgCkDVzFhae8RCUlcaH/xeclDFACZ2d5n7HB5yzXk78Mk4YOvXBAQZtIzKXsYf3
X-Gm-Message-State: AOJu0YytmvUh4kB1tXG/zntd2xNqj1OOXWb5OvjQBXtwZU62H02GFZOi
 qV7YWPz/IBe3tKlcW8GfPeuLPrQiN1eTkyO/ex6pBfEUNGZMWzNidNoH16Y1uIFSraAKMIn+/3O
 MmKBWisM/3B5abd6L6qHrJaxx9WgfML75ii0NAU/oG7B74d2z
X-Received: by 2002:a50:f610:0:b0:56c:3644:9945 with SMTP id
 c16-20020a50f610000000b0056c36449945mr2899384edn.7.1711645199407; Thu, 28 Mar
 2024 09:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240328163851.1386176-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20240328163851.1386176-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Mar 2024 16:59:48 +0000
Message-ID: <CAFEAcA_SfA6hUKQcBbGrT-vvJHn1yFWg6h=+rUCtYiwML-699w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] docs: sbsa: update specs, add dt note
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: xrmcP1n6L2bI

On Thu, 28 Mar 2024 at 16:39, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Hardware of sbsa-ref board is nowadays defined by both BSA and SBSA
> specifications. Then BBR defines firmware interface.
>
> Added note about DeviceTree data passed from QEMU to firmware. It is
> very minimal and provides only data we use in firmware.
>
> Added NUMA information to list of things reported by DeviceTree.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM
