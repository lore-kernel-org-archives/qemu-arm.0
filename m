Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1921791njn;
        Mon, 13 Jan 2025 09:32:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU72Ms9tRQs1uX1iLjJFhzkEIu0hZV+yKAiiCnaum/sbVq6jhgNgbElE5otv68gWqcHDBqvm2LuiwRLXQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFLkLNf2Oh31K7De5E5ruJoSGQKXkFH7ASWebapsSnTR5rq5hjKbGz9TJUJqzMNMz3tgbsn
X-Received: by 2002:a05:620a:462b:b0:7b6:ebc6:181a with SMTP id af79cd13be357-7bcd9759cc6mr3475030985a.41.1736789544121;
        Mon, 13 Jan 2025 09:32:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736789544; cv=none;
        d=google.com; s=arc-20240605;
        b=AokwRDk80AMc9YjabTOSJirEHAzvKp9fYzWr2roqCoNVyiU1A4QizDxgXJxYoV9+ey
         7viIn/dKJijUyWCB5CjqoRuOUTiR6owxcL0GZK82s4Jsq+Nm1GSf4qltge9J5sqVvzDY
         67LC80c/G4uLAWYjgFxkmHJhVOBBFrJSISiZ8PRBq+S7cjyrQInY72WhJjzVVD7iuIgz
         Vb4QJbLqUe/ZVI+TSsEs2gW3peO9cbfHEiardZWdcus5sCVAh1ux8sj5c9rOl8gE1kW9
         XZwhZQ8TArDD3CzSiY7xkRbgUDEemPO9MiZvKeS+ooMlst++Tcq5pERkG8qGMrK8D0rB
         A+ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=O0pPAsCWt0YA4J6mEfP48d7QYH1eIPWX4k5hPTqjmeE=;
        fh=YaDM8WaggYimI0aH6NqQkGJvo7dRE4M74E7jsCE/bAk=;
        b=WOZG9OpVIfMgu9Je9V5EEE5Y72gxTjtfWjj36jv4TlDOO5j7BZtjXttBrmldmC15BI
         xZBAxaBu7JpcyuSzBx9TBBEVFjb9SgaU6LeeAoDSyAYYDUdgkt1fY84W3mD8dtAcN8Pw
         makWm9vQj5P8mPT5mvsDpYSetqm7CZv7YFZfXFzLyeRKv2u+76fHJvj8pOA9T6ye/vUJ
         F86czMKkpzBJMh3s9GOTtud0Ct/OTt4Dww8wlsxOF6KT9qik+USic3ZcFfZHeQgRkuyt
         zk2yP+xuBqwcL+sS4o/XwQjtzm6WJZ746kIWKvUVpB34D/Mxzf7+rCPnzUk6S316KG3o
         E5og==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L96Vjnaz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c87414eb6si101234401cf.577.2025.01.13.09.32.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2025 09:32:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L96Vjnaz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tXOIF-0006sy-BR; Mon, 13 Jan 2025 12:32:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tXOHr-0006oQ-Uy
 for qemu-arm@nongnu.org; Mon, 13 Jan 2025 12:31:40 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tXOHq-0006OR-9X
 for qemu-arm@nongnu.org; Mon, 13 Jan 2025 12:31:39 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4368a293339so52598035e9.3
 for <qemu-arm@nongnu.org>; Mon, 13 Jan 2025 09:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736789496; x=1737394296; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O0pPAsCWt0YA4J6mEfP48d7QYH1eIPWX4k5hPTqjmeE=;
 b=L96VjnazgUhoytyTHcTfHYeD7P6Etf3ngxaM5U0WLMvFm7C74WQtGu2oUQ9COyKK74
 LMUzZ07lDb1ghVz3YP1NZpjM/E3Zo4lf69zy9slA0wEM4WzCB2S23BUO8qktDipgqbk5
 OivJmBSPp7eHl61LbdjGOgeKzAcstSRKj3AEjB/IhZ8aipwwBD7LwHB7Ktw7URw5ztKO
 rwANZFGuxM1iEIzXb2sieaOHu9NjUhgnOkDljtJOdfLXJ+R5TCSy41f9zne1PruquRKE
 ymPdD162FjqDdgD6GbFnpBydQtyVCzDazEbdqZAb4esZR+UmrJ3wCK8ibWM0bxhGRbOf
 /0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736789496; x=1737394296;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O0pPAsCWt0YA4J6mEfP48d7QYH1eIPWX4k5hPTqjmeE=;
 b=YyhRZxkGlkRIPshDG+iC1wYILByqxBXhQ4t3QjAbBeC4S2iFAB0k3nQ31YoWfDCrGd
 lKldsjAsAXRdcmtb52IVl/WerM5RQVX3lU5/96hbJ1wnIJBMJFfVg42e1dsz4YB/PeKg
 1aYnYh4ECR8qZnyrP3taPIHjQNC+HeGLoGBvx0oEMHklu2rAQt6NCQ9uSErOgHL/6Ovr
 RKN26RwZUS79WgUYWYtH6Gjm3GdHhYVB8IoKQ/hiy375CRYJhf1KDV5AR1mlKzRhXB6i
 ElLkd4XEiX5I4JChd47Vn2hrObR4H2/1jrCFsXLtMJxMbk0fkz2apKUr8nfE7HPCIMBL
 gr/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYvqCzJgEBXtf7aQikgVlTrTEfv0heKReXore0KR81mr6QibnX3DmHWGNyj1bfxqlIfC7O5/BHtg==@nongnu.org
X-Gm-Message-State: AOJu0YwqdkLSn/xgOtJZRhqjV7/UqKMB0HSq34teFAWQx5TOsseJ4xRF
 wntiGldfJKgTAmou/ncjT2vDOqFirlEYuMorWiz6WDDgugtiQZVo1SpSusIBSoLYm0JSjTGHU5l
 T2FU=
X-Gm-Gg: ASbGncu/QsM6CJzgDbjJE76C+eB2r6i9qM7V6ecrZ69Abe8pod6XINQUKfcUTknc31E
 vJInT05XZ9PshpeNH2mgRp9q9o6650XRJsybsYeDmfvifzcmi6JGaCcI+7ixc5J7ye9jcNYaSp1
 L9UerR/4Or6F9JJ69YkBwmc4LhmX1O9LzTPYdqNHsusvN5sdfLadP9lppLhXsOynbD5P+NC8Usb
 SS3DlCbfy/PmlJ8is305cJwDhgIdRhxxHYs4m/2v2GDI89PQHNRjfVXa/H4q/bMqkwebEASoU7p
 LbsQO1ivA9IuKZyyLez36hNS
X-Received: by 2002:a7b:cc8e:0:b0:436:faeb:2a18 with SMTP id
 5b1f17b1804b1-436faeb2c2emr42873235e9.6.1736789496405; 
 Mon, 13 Jan 2025 09:31:36 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b8116sm12614356f8f.79.2025.01.13.09.31.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 09:31:35 -0800 (PST)
Message-ID: <428a5e3e-966e-4dd2-9597-4f476e5c16f3@linaro.org>
Date: Mon, 13 Jan 2025 18:31:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 00/11] New vmapple machine type and xhci fixes
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 marcandre.lureau@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org
References: <20250112210056.16658-1-phil@philjordan.eu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250112210056.16658-1-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3seVoMQva1eK

On 12/1/25 22:00, Phil Dennis-Jordan wrote:
> This patch set introduces a new ARM and macOS HVF specific machine type
> called "vmapple". There are also some patches for fixing XHCI spec
> compliance issues and adding a workaround to a quirk in the macOS guest's
> XHCI driver.


> Phil Dennis-Jordan (3):
>    hw/usb/hcd-xhci-pci: Use modulo to select MSI vector as per spec
>    hw/usb/hcd-xhci-pci: Use event ring 0 if mapping unsupported

Patches 1 & 2 queued.
