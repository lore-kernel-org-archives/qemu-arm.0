Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2270558lfb;
        Sun, 6 Dec 2020 04:46:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyFee/AWBSRg6tUmujKo06GljSQsrMpS1B1TyHwEKm1whvw+teVqucmn2uV+uMJs+kz6rB
X-Received: by 2002:a05:6638:22bc:: with SMTP id z28mr15472469jas.62.1607258800176;
        Sun, 06 Dec 2020 04:46:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607258800; cv=none;
        d=google.com; s=arc-20160816;
        b=a28L4hRQtHHfzxgvLafKChVNhzIHpBbT5MM7v0HyW1mqJUPuDIfezfbgUnHG0k+qCl
         Ux5oicFqFDCqgPpwIq6LA3QcKRO2mI69RNnB9g/btXdTlw3NAWusMVlnZC4QzhU39tii
         LGKx4sSIIxTEQXLJr05OdJdwsYhKFyqSe9/CLshj7T+jq63qh4XUtlvU5DqUAAbR0AOG
         JwPbIoId7g1XsywskdbLcAH0oI6z9CYqzBR5avrKw4dmDorCxvJBe8i6ixh0XGID7hM/
         peGW5TInSruHYCq6zPAHRV+uDqF+SIr/RzZ2rZ6njIdX1fGJKw9xD8j+buIaznnk/WYp
         8cIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature:sender
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=K+a8GLNhS5kz1ayNB+wyvyeVq/+HoG6SYkYYVIKVY/c=;
        b=LstzeUJ1Sx6hZDAkNg95Cx6vfl+YDC+NB3fZOW+HPyt3IGJ7yc2FawgEvTaGERF4l2
         pauEYSNPer7Nzm8d8FNSgrSm3CvjiglCZflmqmh65tGGyw94Zdii91Pfn6WtrSu743ou
         Glg907rpD60vbRtL0xnqstdKd5R2OZy8gQ+v1k6bQs5pfBfy55ctNDScsjqLaXIAZqd9
         +2QieZSkaiWdR8M2c6cn3m8aj7ZUKVQNpRriUUxQqDPzykQU1UtL+cvFPw4pSiFoUv/B
         wptz6NID+SSAxBmOxiCKpxnZW5Ck25+wfGZxIVbx0ZJmvWi+Il61XdEJ4pI9kav1J7u/
         5yfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=aMeOiHqo;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id q8si7591661ilg.89.2020.12.06.04.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 04:46:40 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=aMeOiHqo;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.45638.81079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kltPK-0004CP-97; Sun, 06 Dec 2020 12:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45638.81079; Sun, 06 Dec 2020 12:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kltPK-0004CI-6G; Sun, 06 Dec 2020 12:44:54 +0000
Received: by outflank-mailman (input) for mailman id 45638;
 Sun, 06 Dec 2020 12:44:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DarT=FK=gmail.com=bmeng.cn@srs-us1.protection.inumbo.net>)
 id 1kltPI-0004CD-Rl
 for xen-devel@lists.xenproject.org; Sun, 06 Dec 2020 12:44:52 +0000
Received: from mail-yb1-xb44.google.com (unknown [2607:f8b0:4864:20::b44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f13a4457-78ea-4c88-ac4f-bbb7250fefb5;
 Sun, 06 Dec 2020 12:44:51 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id g15so10265298ybq.6
 for <xen-devel@lists.xenproject.org>; Sun, 06 Dec 2020 04:44:51 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f13a4457-78ea-4c88-ac4f-bbb7250fefb5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=K+a8GLNhS5kz1ayNB+wyvyeVq/+HoG6SYkYYVIKVY/c=;
        b=aMeOiHqoWIlEFCaxZAxK537taWLP3YfLwHy9hr55Tv3/XfK/C+gOgMr0zIm7IYgTrS
         DuaGXSFleXbBusET2TL2Gr9LYyyVL3MMXAZbeJO65i0daGzKnCM8/QjGPb/iLClvi2Xt
         dk05SPvKyoiefbvMrkObf6y+C5DmP2FfFTiyBZ6D64TLDhjV+cYcdT6SoaspwmMaURqB
         sejpNooNuAB6Pz53TrqPJO3tPLB7qpIqxlt9ecd8FZupF+l8q2Fm67QvOm0TDMcNI8vd
         okm0GGeT210P/4BCUkbdztGT6oxXeUvxAI53QvTIwtFW7DEufjgUu8wF4758je3Tf5Vp
         w5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=K+a8GLNhS5kz1ayNB+wyvyeVq/+HoG6SYkYYVIKVY/c=;
        b=StkBkiJ5MTJ5F2iXqzH9IJrdkQjwhUNZJkH7oxZOVbEVfX8qCFNDy1yIpREyoW/X06
         LegLXiF9p6Bn4NuuAY4JcfPRlCMTuHgQplSEDy5XSBupHd8cu+k1kNuHG5JINXqkDGJ2
         vlgl0owogTIznG2d5RNJKYbbQyaD1k11g7XfeiQiijULfTQ1yupwK6+GoDPCYiitY9Qa
         aVW+JEtqK+X1GuOVjBMWQYiW+5oCePppIMHwYsiBcxUj1yVZVJJPjopJsyA4pzqt9nA+
         iagww9AnP9W4CRvzS32SDf1Rui6lTfkzeZST53o2Wyn4Nw3NiZfTPTg0lByHbfeCIgHm
         CSTg==
X-Gm-Message-State: AOAM5337IuaxazK8mHpam3/UKEcVBCFklccfF+p2sk/DUmOfeGG96JFb
	8B/OsRZYFdxzBtDc03KIOLV2zb5lYEGdPHBy1BM=
X-Received: by 2002:a25:bb50:: with SMTP id b16mr18111943ybk.152.1607258691399;
 Sun, 06 Dec 2020 04:44:51 -0800 (PST)
MIME-Version: 1.0
References: <1607220847-24096-1-git-send-email-bmeng.cn@gmail.com>
 <1607220847-24096-3-git-send-email-bmeng.cn@gmail.com> <9f8cdb69-7b74-4034-223f-bfa62cb4e440@redhat.com>
In-Reply-To: <9f8cdb69-7b74-4034-223f-bfa62cb4e440@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 6 Dec 2020 20:44:40 +0800
Message-ID: <CAEUhbmUBeUzjPG=2-WF=UnpMnVkH3qT0FkXpgBhP==yt53UfBg@mail.gmail.com>
Subject: Re: [PATCH 3/3] net: checksum: Introduce fine control over checksum type
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Alistair Francis <alistair@alistair23.me>, Paul Durrant <paul@xen.org>, 
	Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
	Joel Stanley <joel@jms.id.au>, Beniamino Galvani <b.galvani@gmail.com>, Zhang Chen <chen.zhang@intel.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Peter Chubb <peter.chubb@nicta.com.au>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	qemu-arm <qemu-arm@nongnu.org>, xen-devel@lists.xenproject.org, 
	Anthony Perard <anthony.perard@citrix.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 6qpjGjJSFnOV

Hi Philippe,

On Sun, Dec 6, 2020 at 7:50 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Hi Ben,
>
> On 12/6/20 3:14 AM, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present net_checksum_calculate() blindly calculates all types of
> > checksums (IP, TCP, UDP). Some NICs may have a per type setting in
> > their BDs to control what checksum should be offloaded. To support
> > such hardware behavior, introduce a 'csum_flag' parameter to the
> > net_checksum_calculate() API to allow fine control over what type
> > checksum is calculated.
> >
> > Existing users of this API are updated accordingly.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> >  hw/net/allwinner-sun8i-emac.c |  2 +-
> >  hw/net/cadence_gem.c          |  2 +-
> >  hw/net/fsl_etsec/rings.c      |  8 +++-----
> >  hw/net/ftgmac100.c            | 10 +++++++++-
> >  hw/net/imx_fec.c              | 15 +++------------
> >  hw/net/virtio-net.c           |  2 +-
> >  hw/net/xen_nic.c              |  2 +-
> >  include/net/checksum.h        |  7 ++++++-
>
> When sending a such API refactor, patch is easier to
> review if you setup the scripts/git.orderfile config.

Sure. I thought I have done this before but apparently not on the
machine this series was genearated :)

>
> >  net/checksum.c                | 18 ++++++++++++++----
> >  net/filter-rewriter.c         |  4 ++--
> >  10 files changed, 41 insertions(+), 29 deletions(-)
> ...
> > diff --git a/include/net/checksum.h b/include/net/checksum.h
> > index 05a0d27..7dec37e 100644
> > --- a/include/net/checksum.h
> > +++ b/include/net/checksum.h
> > @@ -21,11 +21,16 @@
> >  #include "qemu/bswap.h"
> >  struct iovec;
> >
> > +#define CSUM_IP     0x01
>
> IMO this is IP_HEADER,

Yes, but I believe no one will misread it, no?

>
> > +#define CSUM_TCP    0x02
> > +#define CSUM_UDP    0x04
>
> and these IP_PAYLOAD, regardless the payload protocol.

We have to distinguish TCP and UDP.

>
> > +#define CSUM_ALL    (CSUM_IP | CSUM_TCP | CSUM_UDP)
>
> Maybe CSUM_HEADER / CSUM_PAYLOAD / CSUM_FULL (aka RAW?).
>
> > +
> >  uint32_t net_checksum_add_cont(int len, uint8_t *buf, int seq);
> >  uint16_t net_checksum_finish(uint32_t sum);
> >  uint16_t net_checksum_tcpudp(uint16_t length, uint16_t proto,
> >                               uint8_t *addrs, uint8_t *buf);
> > -void net_checksum_calculate(uint8_t *data, int length);
> > +void net_checksum_calculate(uint8_t *data, int length, int csum_flag);
> >
> >  static inline uint32_t
> >  net_checksum_add(int len, uint8_t *buf)
> > diff --git a/net/checksum.c b/net/checksum.c
> > index dabd290..70f4eae 100644
> > --- a/net/checksum.c
> > +++ b/net/checksum.c
> > @@ -57,7 +57,7 @@ uint16_t net_checksum_tcpudp(uint16_t length, uint16_=
t proto,
> >      return net_checksum_finish(sum);
> >  }
> >
> > -void net_checksum_calculate(uint8_t *data, int length)
> > +void net_checksum_calculate(uint8_t *data, int length, int csum_flag)
> >  {
> >      int mac_hdr_len, ip_len;
> >      struct ip_header *ip;
> > @@ -108,9 +108,11 @@ void net_checksum_calculate(uint8_t *data, int len=
gth)
> >      }
> >
> >      /* Calculate IP checksum */
> > -    stw_he_p(&ip->ip_sum, 0);
> > -    csum =3D net_raw_checksum((uint8_t *)ip, IP_HDR_GET_LEN(ip));
> > -    stw_be_p(&ip->ip_sum, csum);
> > +    if (csum_flag & CSUM_IP) {
> > +        stw_he_p(&ip->ip_sum, 0);
> > +        csum =3D net_raw_checksum((uint8_t *)ip, IP_HDR_GET_LEN(ip));
> > +        stw_be_p(&ip->ip_sum, csum);
> > +    }
> >
> >      if (IP4_IS_FRAGMENT(ip)) {
> >          return; /* a fragmented IP packet */
> > @@ -128,6 +130,10 @@ void net_checksum_calculate(uint8_t *data, int len=
gth)
> >      switch (ip->ip_p) {
> >      case IP_PROTO_TCP:
> >      {
> > +        if (!(csum_flag & CSUM_TCP)) {
> > +            return;
> > +        }
> > +
> >          tcp_header *tcp =3D (tcp_header *)(ip + 1);
> >
> >          if (ip_len < sizeof(tcp_header)) {
> > @@ -148,6 +154,10 @@ void net_checksum_calculate(uint8_t *data, int len=
gth)
> >      }
> >      case IP_PROTO_UDP:
> >      {
> > +        if (!(csum_flag & CSUM_UDP)) {
> > +            return;
> > +        }
> > +
> >          udp_header *udp =3D (udp_header *)(ip + 1);
> >
> >          if (ip_len < sizeof(udp_header)) {
> ...

Regards,
Bin
