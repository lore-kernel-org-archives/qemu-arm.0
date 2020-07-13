Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3087153lfm;
        Mon, 13 Jul 2020 01:58:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzo4WYZ2p4Stso4Wc/hZS1BcSKu6owPT3LovWGWWm8MnwYarqKBfyDdZTvyq4sbzjrMdlFz
X-Received: by 2002:a25:3788:: with SMTP id e130mr22539414yba.372.1594630729966;
        Mon, 13 Jul 2020 01:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594630729; cv=none;
        d=google.com; s=arc-20160816;
        b=Vv84VbbPWsjMrOpQacvRKsBFqybOfT7NVG0Rdl38z0pXThlk3RPHwZ3e6uOiWQyFZG
         9SuLxRYctOjxZPgqnRVL7DaF8mFw7D94jQCmHq3gz0qz8ARkwb3Ckgt9BpDTHDRNkv+e
         PfYnPvw7TA6dtnGSmxBJhtSow6masQJGUdEkHMOq2OUSIztBcTI6qfVAjE53NqnKr/Qq
         7CsAE488k6XX7+WPMO/bQB4nOW5SaU5oi/kuQltN5XwoXot60IBZTt4qfxPZX0tMNoqT
         d2+tufDi4Cy8GfHQpLeK7cZ/xxPz0qEP93f/CrWNXOc2RhEiBx7bcXs/Ff1YvfgkLuqC
         05lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=D3KVmfML56QiCpyAp3y6zDHdxvkL94E6Rf+h5FHNqVM=;
        b=oxQj0dnJ1MG7uVp36CUF1gqrkqhdKB/PB+fsp63sQhh+fQoGn9GKpd/UWPkb50//MD
         c2l0Yn2krTlZm8keqGooWZ/X/3DkK2try3cDogIfksPkD8pbLTYtDS659agcng9eRfzL
         wSrxbzpvEhL3UeC01Ls8ZDghFL2VD9qSrUrPvLK0kazXgK5di7xdrA39TU9duRxfC8v8
         D8VSLC4ymDCkQt2w+IMz34NkoaiAjLOBbGVt4wzdxwOy004PsWwyuUiXdX22Su2DT55r
         9dRLWBCpmKT6pL79JJnnICLHL6KwwdYPMbHTpWHYgN3eJr/ELDFFHLXVuJK1m1s53hFB
         AXlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DmnxreMY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si14495577ybk.295.2020.07.13.01.58.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 01:58:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DmnxreMY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juuIT-0005By-Cu
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 04:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erik.lucas.smit@gmail.com>)
 id 1juuIL-0005Bf-Ql; Mon, 13 Jul 2020 04:58:41 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <erik.lucas.smit@gmail.com>)
 id 1juuIK-0002Zs-8B; Mon, 13 Jul 2020 04:58:41 -0400
Received: by mail-ot1-x341.google.com with SMTP id 95so8961015otw.10;
 Mon, 13 Jul 2020 01:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D3KVmfML56QiCpyAp3y6zDHdxvkL94E6Rf+h5FHNqVM=;
 b=DmnxreMYDgjxfE/PQEuTPAk7karL+x+DXvGLK6wJE1v+L64PdsQJyRfiH9+kTeeX+R
 xJKGJ3LnNnMGC2wYS8PQGzPqs1QZW6meRz0xCheM95ff3G6qnDZU5zKmp9JBPe6kzRZp
 C1rNTSldM6FbaRM9WUBNR7AD/kCM3MnK7K5dGWPJhvOdfLw6oIYuVBZOCK4pIRocyfJ3
 hL9Y/rYWsmkvSligpIlejVt2tW52RYafdr/kZHodL7Mv0Ccq7lGe9/PIjfNLCpPMJwg5
 YqKPrDSiLH4VG5wNhIq1LBFWvRFJAV89sLGIKGPbx5Ne7vPZat1EVktzyLkNCxwAfTYs
 xNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D3KVmfML56QiCpyAp3y6zDHdxvkL94E6Rf+h5FHNqVM=;
 b=bD2oWa7wF5rGrskC5sqkGmwIJXSHVQnQLnAkpz1qaDTBRwermDx1TvCupjYlPsDd/a
 akZkrPm9Hh/R8KBPIXTIUHjEtI4Vpc4jLbid7zGs/NOtH13GhoUaVWUTv2Zy3tl5XBPU
 SZk7d/m2keXgi5cTphE2kN3djsxwqUV2FaztdIuy9lhGl2L4NYF4zugviOUSiRRVWXOf
 Z36RG1JO6o/gDUPIHxW0wyL7gF4ZkrIxV6m4yXUgh90wZ5H1+LsYSmiz5jVreZ9Mv3ee
 o0K65T1f9D/bC7HCRJhcsVA/R6DJT+lC7Dl1r8O4DnATS85jxt6vLamG3fq+lZWsvq7C
 mmaQ==
X-Gm-Message-State: AOAM5329oaNY3PdrvwNNmY1WCRqKrgJcdGACbA6ybKI3baD3DzZBZBQR
 4t5jIt/GhtGUOsMLaszBOdFZ8qdq81B6f6IScio8TBEa17s=
X-Received: by 2002:a9d:226f:: with SMTP id o102mr35894234ota.47.1594630718561; 
 Mon, 13 Jul 2020 01:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <CA+MHfoubt1g2FzcjTw3a0vNr7X2T8Jb+nYoc4_x=Z2TP51afKg@mail.gmail.com>
 <a7acba46-5a9a-5dd2-71c6-7e4586485823@amsat.org>
 <CA+MHfot6FdS2yT0mEsCW36bCfwy-WY-1KPQ-KDfYBKzTy=Gd7w@mail.gmail.com>
 <CACPK8Xdqr+EufMgooCY=D+Vt98qu11YTHE5Fzi5+xqX=wKReeQ@mail.gmail.com>
 <CA+MHfouin6Zmz+GrjWRCc_WzPF=ff-z_5V7BLv0HkL+SW9bRoQ@mail.gmail.com>
 <8879bfee-752b-c4e2-7646-c42dec84a440@kaod.org>
 <CA+MHfou6ijtwjzWye6CKaqTa4sKxF1WmgH9juaSdO344uP2UZA@mail.gmail.com>
 <2c326d1c-3b91-96f4-20c0-2e2e1be9b2ad@kaod.org>
In-Reply-To: <2c326d1c-3b91-96f4-20c0-2e2e1be9b2ad@kaod.org>
From: Erik Smit <erik.lucas.smit@gmail.com>
Date: Mon, 13 Jul 2020 10:58:27 +0200
Message-ID: <CA+MHfotwwdVVJmYrWVRrUU7zwJ1jV21bKCWGBFKnCJeoRjtUvA@mail.gmail.com>
Subject: Re: hw/misc/aspeed_scu: 5d971f9e breaks Supermicro AST2400
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=erik.lucas.smit@gmail.com; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rzPwpt1kSGW8

On Mon, 13 Jul 2020 at 10:37, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 7/13/20 10:06 AM, Erik Smit wrote:
> > On Mon, 13 Jul 2020 at 09:52, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> >>
> >> With this patch, the supermicro firmware boots further but there is st=
ill
> >> an issue. It might be the flash definition I used. The machine is dete=
cted
> >> as an AST2300 SoC which is weird.
> >
> >> BMC flash ID:0x19ba20
> >> Unable to handle kernel NULL pointer dereference at virtual address 00=
000000
> >
> > The firmware is expecting the flash ID to repeat. The following makes i=
t boot.
>
> That doesn't work for me.

You'll probably also need
https://github.com/qemu/qemu/commit/2d6c7194c230d334da70b88b1bee5e616595cab=
d

Here are all my patches:
https://github.com/qemu/qemu/compare/master...erik-smit:hack-smt-x11-158

--=20
Best regards,

Erik Smit
