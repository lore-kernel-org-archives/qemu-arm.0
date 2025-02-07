Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp321652njb;
        Fri, 7 Feb 2025 08:41:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWEFg1VjbQY7ybZ11BeuSBh+M4JvkW0tsAvbR3lV+HkXD54iEZQ2+w7H1tnp9HpfB5+j+pFmF7LTiTjPg==@linaro.org
X-Google-Smtp-Source: AGHT+IGhZbHB6eDW5I/fuBzqOjHbpJA30O9fEVtFZ1++Ry115EyS5D/QH8lHy9qsuVH4pxQ2wWhj
X-Received: by 2002:a05:620a:2615:b0:7b6:c4c7:ecfe with SMTP id af79cd13be357-7c047ba630dmr639587285a.4.1738946487198;
        Fri, 07 Feb 2025 08:41:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738946487; cv=none;
        d=google.com; s=arc-20240605;
        b=OziEHLBaPW4JjMJC7QyymPkL9SOsTNW3w2yWBdZxZMzHznWz70IK+InmhCM0xxMCcq
         /baxGvvjAONtughp0GXSgV/WwwmS06uj28mEevPO+ka6PJu0Xsgx0UvIB+s89epWhEDB
         iEnrVS85Kw0YWAbY/5xdYZKnH7QZljQyrqmcBm2k6sJkYru6fJypHzfbxj0Sefo8uIKj
         LB80+B8cmpIgrC2wA47vfFixDxbv9iIzly03MHixr80Sc0QbY5gBp/ryWq9a4RU5VKFM
         Lqs4JjOJJoVqnJV7HWGALv+iljmwgYHwv6zasQnZ6Nau6t/kiv3Yx9iAsUF5gRgEHIPt
         ibMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/s1u7j02fdn/PpNH7d1OI9ADeeEfLYIO2WWJTxBpH08=;
        fh=/bARWT/6wuMSCGzu7umqUHB40D3f3nNUnhiTRqND8jY=;
        b=J4OUVuDsOQCgEP1HrkCqrO9PuSqS3/kZ2A+5ZxAjNurNC46/BdOWP2CHlkjeSfxb/Q
         V17LEk02hK6W6I1yX+lbwG74BGH4a6YZYydzYledg5IaF6lpdwFpKXyHQBu0rOt6CFqc
         S+zhDBGBDDTbh1/Tw0syQ/ksDb9/JsNh6R/dnK5vmc+3wKdplTayyGeETy2s+rhyJDTL
         3toHqrL79HuBejccbqmUV+y4/egN6u7hCKk7NTNXzQeL3lHA+JqqUk2V6hEfiehJ1oPM
         PKO7lEF/tesFSuX7D7r/EqqCfoNj3yaBnN57NJT86V29H2EHnfI72vmzFyBBspcILx9a
         e0dg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NyvKps82;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041df6035si375280085a.109.2025.02.07.08.41.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2025 08:41:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NyvKps82;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgRPO-0004OE-JF; Fri, 07 Feb 2025 11:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tgRPM-0004Ni-3s
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 11:40:48 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tgRPJ-0000Jc-Ue
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 11:40:47 -0500
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e46ac799015so1671218276.0
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2025 08:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738946444; x=1739551244; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/s1u7j02fdn/PpNH7d1OI9ADeeEfLYIO2WWJTxBpH08=;
 b=NyvKps82EwnwzC6Ra/4/Y46yuEhnYB1WRLTReCNuAjwM+fnfrNffjhOa53FemMTBOS
 o+8zHi/QFDJ5hscKBFtb9QZMrH5YZ08WKAqRYDj0v/rRqzFvjvzbf2+3LF29r2fMdgby
 O29O5Kh7WyQ/iIyOXFlQF6jXWAkkaatnEtRXv/MuPiyejagIwmU9lQwAYTqQ5td8m7n4
 +CNC7erfUEnHDCyMyE1tkEwLPpknsL6QeAJvDXX/G2Ss0lntvmPZ1+zak/NDGHstj6Hr
 4vMITxAT2zQX+JoOMJd5b9bIk3f6kkj7+keKOV/OMQD2A7n2Coao7wTZ+c0JaevznYIw
 LdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738946444; x=1739551244;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/s1u7j02fdn/PpNH7d1OI9ADeeEfLYIO2WWJTxBpH08=;
 b=nSBG72GaTbJteXw/ZoJpfiWJTU61RRfkzBlj5FwD3gU0UxnUPtWGtm1LSTvKDzb3wH
 9w9SySRnf2nSGPigYxHE3ZZ9uxR7Mb8t73CsIgcKNxyWSSdVQKTleycGa8Auy6peR0UL
 vSOsYUEGjr+xg236D/b3+mm7SmIYVtDo7gEY+y2SqllYzscgLB9oAQmhfXI3avbpzUpH
 ZDQOekCasMTNtPBU8RdiMuV0Z9mBU5kJzs/1ikE6FwaUS5HTcy8bq5FR3uSabwHNKAJ/
 BbGw3auzaAko1OuB+hUYY4MRRoyjoQMNtXnA2eUA3aAmwa67ruGKWbqoXN2r5GCVUifi
 zv1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbTBJJ5Eq9224b1J156P6pizXGHv8J6IEXAwqr6bsWqHopxV9Rvxz4UHIhHgPHGKXm+GuiC7bjxg==@nongnu.org
X-Gm-Message-State: AOJu0YxSHYmgNLFRmktHoTpkrwh5oFulsMWD/qomlLLXGwSe+bY7gwYq
 sHBzrRcNXCGNKPVij+d/mFl5IckECpePUU8sEWKjzUCkPut6m+jRY+0gL6wS7LoiUrr3Gs5JLwv
 wQe6Km41enHUPPaINQSnTDJGCi0uIe7pkpWV+pg==
X-Gm-Gg: ASbGncuZWc6dHGwM58aQ7x6aPH33J48AuYozjtQM8UklCJZA6uQ0KKdZHv3qXZxQK9j
 NmQEC/ZhrzEKTwARYZ1r7v9jPCbGibDon1u4IqLGSEWMR6Y9riPG0Hp+PCUAYhrWCf/UdRZ8Gew
 ==
X-Received: by 2002:a05:6902:1b12:b0:e58:a2aa:5234 with SMTP id
 3f1490d57ef6-e5b4616ca68mr3144107276.6.1738946444482; Fri, 07 Feb 2025
 08:40:44 -0800 (PST)
MIME-Version: 1.0
References: <20250206142307.921070-1-eric.auger@redhat.com>
 <20250207060822-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250207060822-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Feb 2025 16:40:33 +0000
X-Gm-Features: AWEUYZkopjxOM1-HIYOyKs6aoYi5XsykQrgz6-bQbGpuxCYJENFnKmOLqmZ5U6c
Message-ID: <CAFEAcA8j_ra21a2cuJKSxcL81qoT5aUHmb_mOs1J7aVjdR+eXQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fix vIOMMU reset order
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, jasowang@redhat.com, imammedo@redhat.com, 
 peterx@redhat.com, alex.williamson@redhat.com, clg@redhat.com, 
 philmd@linaro.org, zhenzhong.duan@intel.com, ddutile@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
X-TUID: diKkodmnVEXH

On Fri, 7 Feb 2025 at 11:10, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Feb 06, 2025 at 03:21:51PM +0100, Eric Auger wrote:
> > This is a follow-up of Peter's attempt to fix the fact that
> > vIOMMUs are likely to be reset before the device they protect:
> >
> > [PATCH 0/4] intel_iommu: Reset vIOMMU after all the rest of devices
> > https://lore.kernel.org/all/20240117091559.144730-1-peterx@redhat.com/
> >
> > This is especially observed with virtio devices when a qmp system_reset
> > command is sent but also with VFIO devices.
> >
> > This series puts the vIOMMU reset in the 3-phase exit callback.
> >
> > This scheme was tested successful with virtio-devices and some
> > VFIO devices. Nevertheless not all the topologies have been
> > tested yet.
> >
> > Best Regards
> >
> > Eric
>
>
>
> Looks good.
>
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>
> How should this be merged?
> I supposed I can merge the 1st three and the other
> two by the respective maintainers?
> I don't think there's a dependency here, right?

If we're happy with the design of the series I think it
would be simpler to take the whole thing through one
tree, rather than split it up. I had a question on the
smmu patch which is mostly about clarifying what the
issue is that we're running into, but in principle
I'm happy for you to take that patch as well.

-- PMM
