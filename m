Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1741821lfo;
        Mon, 7 Mar 2022 11:31:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQFgOga0h9lzW+Ev3qbhY7UlLEpri6CP472nHE7zOJFQojLXKjpn7xt8BwRLrL9nwZ2bXM
X-Received: by 2002:a5b:f8d:0:b0:628:620c:a45f with SMTP id q13-20020a5b0f8d000000b00628620ca45fmr8788482ybh.17.1646681476123;
        Mon, 07 Mar 2022 11:31:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646681476; cv=none;
        d=google.com; s=arc-20160816;
        b=DfSw+fW+IfwyohS6hPc8kPJiwKe66QD9wCepyLX514Lzx6fNOvVktIap8luQl5qwuz
         FD8atgHgekCoDbaTQ4aggdYoykspwCXYTA+EarsIRX29k8pxkN3qIIaNDB46fsIFkT76
         oynYRa6AvydqfbD+/e9INdrJj7ofvTMHrsXiQt8qADG1tj962irxMai8YrMdLTnzXGsd
         YTBI4fbEvqbH8jkj2XqFprHfijqDM2DIc2FllDZlwNRzRzF5S4pGZoYsFkNuBXvvMyXn
         a8PhNNCmh52zxpjI9dCxEtxt5pYRHqt8Yb0kHlR092B8/XEO2QaOYfGsObzwMRR+L/Az
         /3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=b+5Q/BguSUazMSqVhw2SH2qkG5kNVZqZ2CMecoqrJkk=;
        b=WA4VBDy4NZ7Ab0PbrIty8r1o2v6hhE7EaAjicmuwxKf+Hbejq/c3NAIjv99opg/2qF
         IBgZ903LYUeQsNRMRso2ZYQpaim/A9AGbb6Vs8Sym7HrbtNT8Apeiz4rIObt5LGRcOdc
         C1UMbxykE+74n3iMrEjQOmOicjnbbK+82NeeIBi4wgG0o5/D3FRc6cDYdxdFceUFmzyr
         zAE1oZ95VrmckRgSTvQDYNyxaNoBYF/+fqBl0/bQXpxQHbSa8I6Pg1tpjgUzuRu0H7MI
         jmRc0EWDiomH2ceG0KsoSFDLXupZChtNlRq8zo5zbnx9uw/hiY2qHA2l3Y24znWwq5wL
         qG3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=l03Mnlk5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y135-20020a814b8d000000b002dc0a3a3a9asi9308696ywa.381.2022.03.07.11.31.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 11:31:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=l03Mnlk5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:58994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRJ4d-0000Ww-FC
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 14:31:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1nRJ46-0000RQ-9T
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 14:30:42 -0500
Received: from [2a00:1450:4864:20::62b] (port=33782
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1nRJ44-0008B4-He
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 14:30:41 -0500
Received: by mail-ej1-x62b.google.com with SMTP id kt27so34373820ejb.0
 for <qemu-arm@nongnu.org>; Mon, 07 Mar 2022 11:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b+5Q/BguSUazMSqVhw2SH2qkG5kNVZqZ2CMecoqrJkk=;
 b=l03Mnlk5JVYSevtecOmRl5/anrJeBQ6FIOsxF3FUbWvsJyYCvXfWPS23BxKle8ERXC
 XtLMRMwiJssZvQifrI9dip3CgFJ2oWy8ifG5bm/iVqY3vaQX5BqTypuQ6oBvUabd0unV
 Ms917FGKIHeN1GDFET2nue0ALaPokAiYMwngFmQCfGrUYOZ0lHkrudZBXqnhOjbG+nT0
 KVOLq3iah6ZGrLHREChY+MMs4c/2NgXBuY80nQsLRL4khzkstt2atSLP4sPM6/3T8kSJ
 co/yT9n6X2V0TqmWT3lwY8GPQcYdMvQs5tC/Wr+mf7CcfWn+rRmJLbDa8cMFbzN73n2k
 kveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b+5Q/BguSUazMSqVhw2SH2qkG5kNVZqZ2CMecoqrJkk=;
 b=ET5AEmz5XBQyMIo6FdljiVWY8DoTKT8rjAUVEQP+nKFfi7+qFXS8BJYtYi3SsFmOhQ
 2dtSOXfCURsVHosBlmNMndRE3XSsoICqqjm6kQFMo9LGf8JmPgtUdAgH4mVWhQltDacR
 Lb503kD0Bqb2Dl6ju+NI5UB4+wE/Fy48gWg8RBCSTsRQ23RguSFOybzSGh/UDHoUp2Qz
 MH4OpOjX+aGVQh1gRxBOnOEUUPpphaFYhN9ZlX1m+JQ/8v3Yg+rZj/jfsg+tq4eMgEys
 2Vrr0pTChoQjfSGJcUIWwETi+0/HEksVKMdGOTYgYCwzdQq0TiN2OUtLMoKNm2RHlf8k
 Todg==
X-Gm-Message-State: AOAM53279Zj14i0vXvoIX5aZMCSaY/QdwRZsrIYafFDCpST/UgfsuCQ8
 K9+qiVHlDWkfkau3xUcO2MF3mO+fsn+/YT3WvL3MAA==
X-Received: by 2002:a17:906:49d4:b0:6d6:e5ec:9a23 with SMTP id
 w20-20020a17090649d400b006d6e5ec9a23mr10270392ejv.79.1646681436938; Mon, 07
 Mar 2022 11:30:36 -0800 (PST)
MIME-Version: 1.0
References: <20220302015053.1984165-1-titusr@google.com>
 <20220302015053.1984165-3-titusr@google.com>
 <8524997d-48a4-9a00-8d94-b6e4d922a82e@gmail.com>
In-Reply-To: <8524997d-48a4-9a00-8d94-b6e4d922a82e@gmail.com>
From: Titus Rwantare <titusr@google.com>
Date: Mon, 7 Mar 2022 11:30:00 -0800
Message-ID: <CAMvPwGpiyw3MhSY8AQkT-5WpsdgONDJz7St_WDwEiEM5j_b+qw@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] hw/i2c: pmbus: guard against out of range accesses
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Cc: Corey Minyard <minyard@acm.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 f4bug@amsat.org, wuhaotsh@google.com, venture@google.com, 
 peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=titusr@google.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9qULc7C+omtp

Ack. All errors for PMBus should
ideally be reflected in status and status_cml registers instead of
carrying meaning in return values. I'll have to separately go through
the existing code to make it consistent.


On Fri, 4 Mar 2022 at 16:08, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> On 2/3/22 02:50, Titus Rwantare wrote:
> > Signed-off-by: Titus Rwantare <titusr@google.com>
> > ---
> >   hw/i2c/pmbus_device.c | 41 ++++++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 40 insertions(+), 1 deletion(-)
>
> >   static uint8_t pmbus_receive_byte(SMBusDevice *smd)
> >   {
> >       PMBusDevice *pmdev =3D PMBUS_DEVICE(smd);
> >       PMBusDeviceClass *pmdc =3D PMBUS_DEVICE_GET_CLASS(pmdev);
> >       uint8_t ret =3D 0xFF;
> > -    uint8_t index =3D pmdev->page;
> > +    uint8_t index;
> >
> >       if (pmdev->out_buf_len !=3D 0) {
> >           ret =3D pmbus_out_buf_pop(pmdev);
> >           return ret;
> >       }
> >
> > +    /*
> > +     * Reading from all pages will return the value from page 0,
> > +     * this is unspecified behaviour in general.
> > +     */
> > +    if (pmdev->page =3D=3D PB_ALL_PAGES) {
> > +        index =3D 0;
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: tried to read from all pages\n",
> > +                      __func__);
> > +        pmbus_cml_error(pmdev);
> > +    } else if (pmdev->page > pmdev->num_pages - 1) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: page %d is out of range\n",
> > +                      __func__, pmdev->page);
> > +        pmbus_cml_error(pmdev);
> > +        return -1;
>
> This file returns a mix of 0xFF/-1 for error. It would be nice
> to pick one. Adding a definition (PMBUS_ERR_BYTE?) could help.
>
> Preferably with error unified:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
