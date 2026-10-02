Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C0ACA5FD6
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 03:10:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCTfV-0004tA-BI; Thu, 01 Oct 2026 23:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xCTfT-0004sB-Sl
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 23:10:39 -0400
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xCTfR-0004Nn-C4
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 23:10:39 -0400
Received: by mail-ed2-x0c.google.com with SMTP id
 4fb4d7f45d1cf-6aeeccb7d59so2019032a12.2
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 20:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790910635; cv=none;
 d=google.com; s=arc-20260327;
 b=moVJLCXpHB8rgueIFrGpte28RZmoPzhkAghPg0RLpNnivperM7OHm4d3Kr/RY0UgfX
 g+6MepVeNsX1XORv5V+TB//hLjq4sKefqFbvotUq3ShmDrarypuP4a4IuAej800KI3pe
 Aau3CJwxXcBuhn7PcaKmVcggMSCUd6Z+K9f37jgTyGXB7q+UGqONN6gSyYpUQo50SFVf
 +y47MvNt68/SlshD016AuF6hkENGqMVGWdNO0S3NF3zhTeC3/hjh1nNZC0Pbw1sLRUqm
 Az7JKmh4E2oewhBDM0+wATX/v0k1eGkc71GOlLspYbfBQjWKW5MslXFJG9VlvNQz8znB
 b0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=O2qwL9HHfLSa8iidf6iXkOt32mrRAdwATltII/NaBwI=;
 fh=JVd2UoWHa+/MONvkTi0ZDs3G73UyHWr+VY0a+Czkm7A=;
 b=Y5x6Px4bqYdYcNIcVnNKJETrdvHCdecihF7ijeENkaJ8IivbpZ6CPdMmnHiLgn8bvi
 WlDPnFv6gR+6U26pe/sdC+963ROAXqTsw0qaMDV+szhxw5ivYPcbGSp3z4YCLi+JVENn
 aazk+dO524sn2lScv8EE48iGdJOBtA8WQbTLmvtp1ddZhD/wBkxj6UnN+Hrs+qD3y4dh
 1okbO1EE4qT3S/BizhfPMCjkRWfDV8fluFCk+PpJ6ZvwOdnElXA/NLtuZV24DCqa63xx
 /2A/94MvQDBjX6+5fqJ99GWloZMgN3QGpnNTlpl3z/QglnH13zxYMFX1Arptx4FCaoU0
 Y0vg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790910635; x=1791515435; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=O2qwL9HHfLSa8iidf6iXkOt32mrRAdwATltII/NaBwI=;
 b=hT2oSSR96rJIknSbB8YtZeMnMivA3E1IoesMW3S3evXZhD0IC753Ex7rNUe59YY5Z1
 WKQCkFomIjXwVV2gQ4kE65GhyFPvjVyVT3o9+tgI5WTYg0UYFTs6VtsiXoikfNHsaass
 4P9AeWtHH2aQjdE4R727f8VoCxlvrecHxcxRVNnQ0vSX9gIIhhevYwAJrvLoLHlfyGdY
 O9EKDdc9pATWcmrDtpb/6x6urD1L4uLeM1TTuMqnFSdS4HFcmcfttFQQnPbSrxoT1XA7
 y3GJBpf9CTacXmNASBk8ZYAHLv9Nu/NWaicV8IDv/WmSZVTdnVyYFaFtnt7R1xnd2Fsf
 81rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790910635; x=1791515435;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=O2qwL9HHfLSa8iidf6iXkOt32mrRAdwATltII/NaBwI=;
 b=Yl3zBHVfx8qIn8I94/J7ul6likxEEeB7sI6pOU2bpOdzExl9paeZoEFpjpuW+m7wCZ
 mSASkrSZOw99sCyqtnp9Jm85CtO0FJ3Vd8DnrshU7+KRRASvdGFlp9Qwfx/UougZUDQa
 SS96RHuzAJAT/Mcui/WIzaFeXf5Dbb9GPPk8QpTwTzA2bvmWBJiVTwVUGT4kVIQF3jKW
 zy9a8VYEVz3jyc0JF+e/GpFYQ8Fr9Seeahs2mJ5yOaplO7UVWwOm1CeEqIFWuzy2sUTl
 b4EtTUZCV2wQaHA/xwjqpnX0N0RKIeKVLH1MosBvG4F3UeGoKSMnrQ31aCnSbBJS/Q4J
 uDsA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw1hvZLc8GzawzbuaAkNAM805RbKs0P/8V/iJWnomC4u2vmF1CaAHDwiKb8ype0Us9gRtFVrZJjVg==@nongnu.org
X-Gm-Message-State: AFq9FYKN3lp3uP0oqlx5MN7v+q7B4/uLuZIK0PR5TSDfEzDK9m8iWdTZ
 5JL4rAQtbqXdOcgHxPNrSM9vosDXXeu8He/VLkg4w6escOJbnR2z+DL6Kzh9Gg2CV4jYOCAdr+u
 ktTdSUM7mYrAzcZ9dDIDGmNcR7J82Row=
X-Gm-Gg: AYBFou1FEWbajmJeV6wyVdOt3eF4NGmCSarWSk2JPA30EnZwKjSewxo60GPG2yEfExD
 jyaqPg9iYQImPex9FbqGHeTpua3BybAoRQYgUJLSVA694rCYsG7z2ZwimF8TghfHSY1h0Vt82Kl
 m46dTD3cHAeiI4IfH6T4ooKKAiDrD1Ejzm/WIZRayvOXGgnJz98iC4eaXPlNg6ERrIo1QV7Uxm3
 ZyZGjniiER1e01Mi4GK05EWo3NQgvygJ1Td0NQ5D16pfQFfNp7c0JooR4nNRsNvGNoF7IiGgBAy
 qsKN75vD9xgVkaTrWg5mWok1yxGWleBivjY3gchzTs4+Lfl1CwTOwiVz/byBQZU3DA==
X-Received: by 2002:a05:6402:241a:b0:6ab:81e:e827 with SMTP id
 4fb4d7f45d1cf-6af9e342c7amr588658a12.43.1790910635387; Thu, 01 Oct 2026
 20:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <82250296-78bc-4345-9e57-1fcac485d18a@oss.qualcomm.com>
 <CAE2XoE_+nhj58M9_yx6wf532qCSVcERpTw7F4AU7PXN7prhpzg@mail.gmail.com>
 <74853ef8-7315-466a-99ac-41c8182f9b13@oss.qualcomm.com>
 <ar4TQtKqfXX5Ul9O@redhat.com>
 <CAE2XoE8q3LYJ-JCTbRBk4iPdUQdRE8zzmOgiZ=HEXDL78iw8UQ@mail.gmail.com>
 <26b0d44d-0322-4ceb-a47b-747fc52c61b7@oss.qualcomm.com>
 <CAE2XoE8VyCpPCqRVFArBn_dDsyMw8vrSJxWMhKq17btZvO2n6A@mail.gmail.com>
 <b02db9e2-b348-4011-a98d-122e9d9f17e5@oss.qualcomm.com>
 <ar6a_uDw9OeLng6c@redhat.com>
 <6bf4dad5-4fa2-4df1-b6b8-d594dbd3842c@oss.qualcomm.com>
 <ar6lw3jAcnVej6vK@redhat.com>
 <557262df-b8e7-49b5-a245-ae46b8885b30@oss.qualcomm.com>
In-Reply-To: <557262df-b8e7-49b5-a245-ae46b8885b30@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Fri, 2 Oct 2026 11:10:23 +0800
X-Gm-Features: AclHuK-V0xU1FhvPsvL3Y6lfOZX2d6Sg1XJ8ZXrABF_10hAEPt_ryix_uYLfPvs
Message-ID: <CAE2XoE8mmz9jjhEgJUYZ3Symk==RJTSO6uVy_2haxcuFkunmHA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] machine: allow -M name to differ from QOM type
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-devel@nongnu.org, Chao Liu <chao.liu@processmission.com>, 
 Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, 
 Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Fabiano Rosas <farosas@suse.de>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Song Gao <17746591750@163.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:33::c;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x0c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, Oct 2, 2026 at 2:56=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> So, for existing binary: -M virt works as before.
>
> For new multi binary:
> $ qemu-system -M virt:
> Multiple machines were found, select one among:
> - aarch64-virt
> - riscv64-virt


This is what I implemented:
 ./qemu-system -M virt
qemu-system: unsupported machine type: "virt" for target "none"
Available for targets: aarch64, arm


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

