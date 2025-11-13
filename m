Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A67CD6E7D
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Nov 2025 15:04:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJYri-00011E-RZ; Thu, 13 Nov 2025 10:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vJYpg-00077D-0w
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 10:01:59 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vJYpb-0007Qc-IF
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 10:01:55 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-78802ac2296so9954907b3.3
 for <qemu-arm@nongnu.org>; Thu, 13 Nov 2025 07:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763046104; x=1763650904; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UQpCjXMzltzkBAk1cWSLy/WZzoIwfDzQGuuOWhLwCNE=;
 b=BUB+6lSJgHhcKuXDO2FGukZQybP4ymhTnAY1OVeVeqUZCs63OmMhi2x8PgPFGt8f86
 nwc7R2kEzx2UUOaGL5fHWO2cmCB7QzwAlkOoodXl8j++BcxdhlytlinTb7P8AjDEylHK
 4091wnFAhcVAZdX/OR3VszNEWogltUUCTXnpJNvs5kRzH94LH4BbZX8uOkeZO5LNqila
 ZGy5pPEQH3+9KBfaVl88kn5/+GUZVGfRGMs58D6HHj2Gtp7uUcWwW38cOSj+fH5oLOj7
 dZUDayR9fewTvn/bBM8aN2loJcZL6R/q6JcYEOnNiJXUn3NN00PQoE/ubH4+k5H82R2C
 fNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763046104; x=1763650904;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UQpCjXMzltzkBAk1cWSLy/WZzoIwfDzQGuuOWhLwCNE=;
 b=tsUFawedg3RZIl5DZsdbgrK2zYoNstFP1In0Pxif/CwHx6W45EHmHi9qIjwYzEsOUm
 tExdLWWyLdirN+Trgnz5/3p21lHwsZ9gLT9bW7aOGUJ+cuuQ5o7+Dipz8hFipU/H2pnu
 cp7O0Q6whgnaLMGmIyehhWGCxkts2lwJBRLELUsywDCW9IO1+NHrbwhs5ZW5twV0B8qv
 D/BZmlZ0vAcaMWgZz7GFi2vco33NjAxwJECOKiYsggm5jPSWMvFgRbn72dcbF4QDA2lt
 ImvBk93QOCIQzhuGUWGjzIM9K1qQqWi5LaeARi6IMjueNU5misqWziNosmUmUEVtHd6q
 Xorg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb6Zcmo6xPyt7XTqKkTtLCPOcEf2mXiD5iC4+UhUxncXJOiZIVvkkxEoAi06r0oQecwjrbhoSr+w==@nongnu.org
X-Gm-Message-State: AOJu0YztcuweNlFDR//BplH2n+p19bVkb9zHbT1BES6pRk7p6NUS7k3t
 EjZYJaVLH4ipBid38TZoHuXjfE/iZijWCOIQNl11qnghQxOxS4CNXlexCbG0Sw5tqyOWHVeR3JP
 bVTHt0BJOv8LU6AH5qdmcICnCtNgmI5KifLP2cTtgxoNrSjMhdlwTULY=
X-Gm-Gg: ASbGnct6t1pon1V9Pb6TXXg/HdtxlB9sFwEe8ix6wsfYORLOAaAhRD8M1x/SINz7tAB
 1JFCTziFVU1irec2ns3FQZ0MV0xL7ctpl1gUsgp2/QBqVxq4vfBcXHFCg/YOzdDf72D5E+85Mz+
 1h41wGJ1EYRevuEhCPgYsl1Ii2xR25fr9hyg9meCllOgBrp+d0FzVFw6An6UJXrPvgTj+gsuF4Y
 F2lMlETIG9LKU2pCusn3kQtsJL3v/LWIDTPYd/CAKuHj+QYLMq9YH5ujCIZJg==
X-Google-Smtp-Source: AGHT+IGcJpPS1WsYzqNoG9Dnm25rLKNVdipiNLeP2dqcu/KF+K5YZRKRsEaVb6OfY1WRgHiBAFPhS2NNVlDS20AQ2kc=
X-Received: by 2002:a05:690e:4186:b0:63e:b62:5826 with SMTP id
 956f58d0204a3-64101bb51c3mr6052682d50.67.1763046103202; Thu, 13 Nov 2025
 07:01:43 -0800 (PST)
MIME-Version: 1.0
References: <20251016140039.250111-1-eric.auger@redhat.com>
 <20251016140039.250111-2-eric.auger@redhat.com> <877bwtvaj7.fsf@redhat.com>
 <791e0383-c4c7-49bf-863c-d45428f3e48d@redhat.com> <874iqyrnt3.fsf@redhat.com>
In-Reply-To: <874iqyrnt3.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Nov 2025 15:01:31 +0000
X-Gm-Features: AWmQ_bk_FOYBCGthsQvsC4iCOFYns5evbDOjO7gyouMYynzLNQLMY5LXztggWFY
Message-ID: <CAFEAcA8F2JFR-X9oWH9cX+qESWDUbxfU+ZiPmFg2h05dgb4gRQ@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/7] target/arm/machine: Improve traces on register
 mismatch during migration
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, maz@kernel.org, oliver.upton@linux.dev, 
 sebott@redhat.com, gshan@redhat.com, ddutile@redhat.com, peterx@redhat.com, 
 philmd@linaro.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 13 Nov 2025 at 14:48, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Thu, Nov 13 2025, Eric Auger <eric.auger@redhat.com> wrote:
>
> >>> +    #define MAX_CPREG_VMSTATE_ANOMALIES 10
> >>> +    uint64_t cpreg_vmstate_missing_indexes[MAX_CPREG_VMSTATE_ANOMALIES];
> >>> +    int32_t cpreg_vmstate_missing_indexes_array_len;
> >>> +    uint64_t cpreg_vmstate_unexpected_indexes[MAX_CPREG_VMSTATE_ANOMALIES];
> >>> +    int32_t cpreg_vmstate_unexpected_indexes_array_len;
> >> "indices"?
> >
> > Originally we had
> >    uint64_t *cpreg_vmstate_indexes;
> > so I reused the same terminology
> >
> > As a non native english speaker I don't know if the usage is wrong. I
> > thought some references on the net though
>
> Not a native English speaker, either; wiktionary says both are valid, so
> probably a matter of taste.

Mmm. I tend to go with "indexes" as being clearer (especially
for non-native speakers) than "indices". Within QEMU sources
there are twice as many "indexes" as "indices".

thanks
-- PMM

