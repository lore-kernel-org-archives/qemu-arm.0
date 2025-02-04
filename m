Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp329936njb;
        Tue, 4 Feb 2025 08:31:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU6dWbmJzjFseDDOmyZASOUhtmD/ihbhu9dUrs5MhMmuInXF9kUc8C6ofIpmNm92wdM6pGT+PxRqW7mLg==@linaro.org
X-Google-Smtp-Source: AGHT+IHnIDjiMyemML/Uf/Yiq1Gr7nj/y5e6CUq2RULDx303ByfHFutjT+6b3I7uhyWA2yJ7ZSRF
X-Received: by 2002:a05:6102:c8b:b0:4b2:cc92:169d with SMTP id ada2fe7eead31-4b9a4ecf98dmr19106261137.4.1738686709570;
        Tue, 04 Feb 2025 08:31:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738686709; cv=none;
        d=google.com; s=arc-20240605;
        b=LihObH+fySsbr1ZguLFd4m0AlMaEYzCOWI6Ke0TFBUWNREjo7Qq+ceEuX9EJb6G21w
         2j6NlO5d2JgOoD3E1MWC4mGf7mn9WPL76UgH+/VXDbDv76UnxrErWqet6ojaPH6IA42v
         ryXEsDj4sSni0ot8iVrYLyX3hUIVSWr5/MvzO1vnYOrT0P41+Ea3TCnV/xmwjmRGGS4S
         L/KmC+fhTlkaXytAIhd28mJ0p7wWyxWdwIcDzw7QOGvJuwKE+FLknjnFUS/k6CjVZkDk
         KS364FCkWKPH+ikN98y0r1ttR5Dsfw2Te8Trqv+sH0J7WNis8V9/h2pPZHkZ1S8xyAOs
         1TAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=6jO3SEdCWmHUg9X6atoMMcR4mM2oH2x4+LOOL6tTUMs=;
        fh=bkCr8YGdZKa/VjP8PkZkMrIQTAu9pr3e90RwzsW5UvU=;
        b=WBsIju5iFiH7fPNkQEgKca3G1/+1xvWAWKSlDuuK/5Hi1y+Ya/iUTRg+UyXKb2OXV7
         c5GCuwy2RuQcuwiChYTeoi+kn6xsslgGS86smUcPqlBRq41MXUSO6c4PCZepfmWcuGy9
         BGX2ubpn2xqoJmxkQnzd0MIlaKmsNFF+ce0Wi/EJoibOdH+3wxf3rFC/IQ1MzU5WsiQD
         lKH98JXBdyICnVPV1oaoYEgFbtaKKMK1MzKJn5KieCHOBM71tUaofMO8N9iMOhSHoxVA
         EmjggBxl6IWn236fA2m9XX6kGTcKqJ2Po01IU8+VtEaK8oMDyMIuuk+9dDftjZXMFGX9
         qkmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j6n7h7jt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b9bae4a255si3089639137.546.2025.02.04.08.31.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 08:31:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j6n7h7jt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfLpv-0007FH-1E; Tue, 04 Feb 2025 11:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLpQ-00072M-VZ
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 11:31:13 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLpP-0003Zb-2u
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 11:31:12 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-6f006748fd1so43480687b3.3
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 08:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738686670; x=1739291470; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6jO3SEdCWmHUg9X6atoMMcR4mM2oH2x4+LOOL6tTUMs=;
 b=j6n7h7jttXLKHv/xKjLA0ybIxBcFCG0ZkWQ7F++MDZfCFuulEluhJ9T81gc9zp2QZK
 cNWhS+MwKPpji3YV4MBUy08xsIjlVz09uMylqiHm/jAmIxcBcs7FFkK0K585jk6RkQuK
 s6cWQMNLGEulLbLyU3V7SgNxhvkjqCCw8GbHkih8Bk7eNUo4va4qVq8oE0ySH5T5T5H5
 9Kf3udnzQ9pJ02KUui6k4Ir7GtmhIEkBqlVxbt27jq8WOzveqewwhwTafmyIpQSSqDSj
 1j0BHjLP2ZKwuwsnmat21CPokNU1G1FoRUX4ct8hmfsVt+uylz8+6S+3Nr23gfFU9S2x
 3G2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738686670; x=1739291470;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6jO3SEdCWmHUg9X6atoMMcR4mM2oH2x4+LOOL6tTUMs=;
 b=ktvYY762OWSMTrf9VQXER4BJTRXz2d5kAxz9MPutI2WnNej7+BzY6xSoWmxoqamh4S
 U8lI0Nl8vcLdh4eFb4c+1HU5odK8m0ZWrYUnuS+bTRmPVUgGbSJD1ahNhpW0LqAMg0Nx
 l2HFGjBXY9H8qZ50nN9N+a6c134svF1OCAQ9UT5yuWSyRuo2X0kAVKKOJiem8gzm3Bsw
 rcdba12g4QS1jbXEEY0oDpBYD4uPXAPXi4uo1gHoktYZ6qon0zVUtDGdoC8Xr7L072Jc
 yoPsI1d6QOWp9Fa9tRTYkodaqtuj8XvvDR29BUZi6bW78Ew8tJsDP+SPSMhRWFkiasJg
 Mugw==
X-Gm-Message-State: AOJu0YyzoE/DQ89RrKhmGRDkdQKgYoUVBkvn+SHIbL5qELNy7LHxWpOx
 0bl5sKNmqSZpTZv3qUbBZR5HOD1Z7ZQL/p6xbEfBNfAGN7fZBoia+Ibpi/onVRYwUkLckE+rJLG
 tT4SFzKttcOrlHJ2mCa5TVXSP3OxJSb4lt9Xqng==
X-Gm-Gg: ASbGnctKxYehduJ/uciyOkQFwrImBKQvnHl4kRqEnZsKPPNtx3HRG97WVOirKOkNpXR
 e0ZHaK6P9rbdmGrMlVAur2FgEreHuqmNL03Kee7tLzhm89EbOt/h+5L+02HgoFchtpybj+HndHQ
 ==
X-Received: by 2002:a05:6902:2191:b0:e5b:fed:7b48 with SMTP id
 3f1490d57ef6-e5b0fed8ab7mr4921685276.43.1738686669706; Tue, 04 Feb 2025
 08:31:09 -0800 (PST)
MIME-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
 <20241226082800.2887689-3-wuhaotsh@google.com>
In-Reply-To: <20241226082800.2887689-3-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 16:30:58 +0000
X-Gm-Features: AWEUYZkBFhZoIe4sUSyWlrra3qpe3BiyyGLPZGwbmdeUE__VgRy-TWUa5xks4wY
Message-ID: <CAFEAcA_N0wiJRjLUsJzsXFBvBpnsqTK_-YPb5CK5sqE=2MZ3ew@mail.gmail.com>
Subject: Re: [PATCH v2 02/17] roms: Update vbootrom to 1287b6e
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, hskinnemoen@google.com, 
 venture@google.com, pbonzini@redhat.com, jasowang@redhat.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
X-TUID: 2IQ7KY7Sk/Ce

On Thu, 26 Dec 2024 at 08:28, Hao Wu <wuhaotsh@google.com> wrote:
>
> This newer vbootrom supports NPCM8xx. Similar to the NPCM7XX one
> it supports loading the UBoot from the SPI device and not more.
>
> We updated the npcm7xx bootrom to be compiled from this version.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
