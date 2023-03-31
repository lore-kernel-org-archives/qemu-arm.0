Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp280299ejb;
        Thu, 30 Mar 2023 17:06:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350b8nFRWNFN5ZnDVOmRiWg9cgeVdSKnR5kCKfcNIJca4MpObstgwM9SVJ/KGleLbTPFXqGQN
X-Received: by 2002:a05:622a:11:b0:3e3:913c:1c9c with SMTP id x17-20020a05622a001100b003e3913c1c9cmr13540200qtw.1.1680221209831;
        Thu, 30 Mar 2023 17:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680221209; cv=none;
        d=google.com; s=arc-20160816;
        b=hQfB5IM5tlUb7m3cMbKa3JNNsY33gBjuNgonvybuJiX2z5Jt0ziv2y35zbPZIJOAwa
         KUSpjXfvKnxWClGuerU4t3ITSaH26vp4/tVE9r2+otubOi55zueNqWs3GTVyw6jKYcM/
         MWRPixXO1/HMtr/S8N/q8NuuUwDBqPimjXCuJw6sJu4s6RcdwsW5KazFsG8gnOm5qdxF
         NRU0R24IuHakPE+V42k7aLFrdZ9lA1LtXTKjGVYpO/vJX9xlX6trvaBxTrq6WmZWlejG
         fUlwzMQhkRk2w0oMZgdL/CRShDG0/XKUAMwG6xVUjnwr7zH5jOSvAfZq2bVys54K3AlP
         rHcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1WLBC0gjVME/dta252pNYiZG2XKN/7BIovbR1073VCk=;
        b=FbVy1A2uus+X7CdFGqgVQ6UjUmu3cT3zXds0R2Ie75dKOYn8ZjnJooa6F+BRT67d9l
         jfuZMRPug/Ddfp8SHyqjwZQjFT5h0Ks1chKospsINKeVb/Ko+rkrSBKGEVqc9cUIa1k9
         CzF2qYORgKpPAuUGuBLxh1EDkOp84WbWyrcn2txFSTMsrr1zpuDCAgJ26xYAxf+JEMWJ
         f91bisLY3qG8G1oJGuYksaFRJ5RHk5jRPg0RtjR5yi/+7TFs3Lklw7dMe67kfaV8lr7Q
         u37TX/PIjjC0kFbdZramVNq2vmm1uvCHsOatJbqqqXmJuWHJsXFDVeWejdURKmgZcD3E
         fTLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=kFXcg4Cv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11-20020ac87d0b000000b003e63c1da75asi586774qtb.451.2023.03.30.17.06.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Mar 2023 17:06:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=kFXcg4Cv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pi2Hi-0006IG-MK; Thu, 30 Mar 2023 20:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1pi2Hh-0006Hq-4N
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 20:06:25 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1pi2Hf-0005Lr-6C
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 20:06:24 -0400
Received: by mail-wm1-x32b.google.com with SMTP id n19so11957871wms.0
 for <qemu-arm@nongnu.org>; Thu, 30 Mar 2023 17:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680221181;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1WLBC0gjVME/dta252pNYiZG2XKN/7BIovbR1073VCk=;
 b=kFXcg4CvRmwG8Kt5ydf4zjfhhX+wvw9WwqFhEGMnJkN8QSQu5BTGIPdVDqFwfwr6yB
 IXjEKS3qPAFSAOd7yEpwkblSbO6rwcpRW8HZGQ3aqbevC1/DQUDzkVlOIHVs5SXiSrqt
 tdA473chTEbENhBxMY+HC5UeW5Sp53pXFdgfRnTJIc4wcYtdn4L+dtHvnFXiHINNiwJf
 bKlk5o8AKuXpyMfowr/5A33cnl5e0eBtCocgeLHyIO7jT0Vfu0It/vsm6Bu/jn4mjCfM
 M92nG2/YABxBJSm5EFlICMHDqRuHppJnjSefc/HKsqPsvUULiif3yWxMntXIKSIcuL6D
 omyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680221181;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1WLBC0gjVME/dta252pNYiZG2XKN/7BIovbR1073VCk=;
 b=qLWebof65tJu+Wb14+fDzbUD0wWSjv5Jj8tR6zFEy+0xwctaYm5Bq671Uv0oV0bIx6
 JKI1zDh7E0Jb7ROxH5eMdmveLwnsnoGslggrLPjcytsenQUW9aaWOLHImJHyu2Bshm80
 TpQ3AULrhPbmUHPg6XrnydsDldaggddLl3gvmWJhUEKtoJhNxSHys8hai9v0G9SHicGy
 XgfdJiL1ggaQHDWVNNS/7zLEx7avfOiMpAGrTqnhAdmf9HvaTWex+NQnjQd+Ybgfx8Z4
 RB+KShDiOeoNKFzrGm8epa70qfIfD/9q3t9po0l7TFGRjJP2H6cWxmY5xUkLSsY3vm9H
 fL1g==
X-Gm-Message-State: AAQBX9e3sYp+sDq/DgHkp118+zVEqRJoYZ8YZM8QfOfARmXqEf3baXA9
 uSuEKbygrNDatdpxnPN3svm2FOYy7vTy2fjfzj8Qig==
X-Received: by 2002:a7b:cb10:0:b0:3ef:66ec:1e73 with SMTP id
 u16-20020a7bcb10000000b003ef66ec1e73mr4442601wmj.6.1680221180629; Thu, 30 Mar
 2023 17:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230322175513.1550412-1-titusr@google.com>
 <20230322175513.1550412-2-titusr@google.com>
 <ZCW2XDxAzptykEQf@minyard.net>
In-Reply-To: <ZCW2XDxAzptykEQf@minyard.net>
From: Titus Rwantare <titusr@google.com>
Date: Thu, 30 Mar 2023 17:05:44 -0700
Message-ID: <CAMvPwGrpLey-GtWvo4Hjv-bjWZPF=cdcvWbNCAn=7HsvctUvrA@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/i2c: pmbus add support for block receive
To: minyard@acm.org
Cc: philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>
Content-Type: multipart/alternative; boundary="0000000000009df4c805f826fa3a"
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=titusr@google.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: kLNHTM4ZWwvs

--0000000000009df4c805f826fa3a
Content-Type: text/plain; charset="UTF-8"

Apologies. I've updated the commit descriptions and added a sensor using
this code in v2.

While doing block receive I discovered that it is valid behaviour to erase
a field and have it be an empty string.

-Titus

On Thu, 30 Mar 2023 at 09:18, Corey Minyard <minyard@acm.org> wrote:

> It's generally frowned upon to have empty descriptions, some rationale
> would be helpful.  For instance, you remove a length check from the send
> string, why did you do that?
>
> Any why is this being added?  What's it supporting?
>
> -corey
>
> On Wed, Mar 22, 2023 at 05:55:09PM +0000, Titus Rwantare wrote:
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Signed-off-by: Titus Rwantare <titusr@google.com>
> > ---
> >  hw/i2c/pmbus_device.c         | 30 +++++++++++++++++++++++++++++-
> >  include/hw/i2c/pmbus_device.h |  7 +++++++
> >  2 files changed, 36 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> > index c3d6046784..02647769cd 100644
> > --- a/hw/i2c/pmbus_device.c
> > +++ b/hw/i2c/pmbus_device.c
> > @@ -95,7 +95,6 @@ void pmbus_send64(PMBusDevice *pmdev, uint64_t data)
> >  void pmbus_send_string(PMBusDevice *pmdev, const char *data)
> >  {
> >      size_t len = strlen(data);
> > -    g_assert(len > 0);
> >      g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
> >      pmdev->out_buf[len + pmdev->out_buf_len] = len;
> >
> > @@ -105,6 +104,35 @@ void pmbus_send_string(PMBusDevice *pmdev, const
> char *data)
> >      pmdev->out_buf_len += len + 1;
> >  }
> >
> > +uint8_t pmbus_receive_block(PMBusDevice *pmdev, uint8_t *dest, size_t
> len)
> > +{
> > +    /* dest may contain data from previous writes */
> > +    memset(dest, 0, len);
> > +
> > +    /* Exclude command code from return value */
> > +    pmdev->in_buf++;
> > +    pmdev->in_buf_len--;
> > +
> > +    /* The byte after the command code denotes the length */
> > +    uint8_t sent_len = pmdev->in_buf[0];
> > +
> > +    if (sent_len != pmdev->in_buf_len - 1) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: length mismatch. Expected %d bytes, got %d
> bytes\n",
> > +                      __func__, sent_len, pmdev->in_buf_len - 1);
> > +    }
> > +
> > +    /* exclude length byte */
> > +    pmdev->in_buf++;
> > +    pmdev->in_buf_len--;
> > +
> > +    if (pmdev->in_buf_len < len) {
> > +        len = pmdev->in_buf_len;
> > +    }
> > +    memcpy(dest, pmdev->in_buf, len);
> > +    return len;
> > +}
> > +
> >
> >  static uint64_t pmbus_receive_uint(PMBusDevice *pmdev)
> >  {
> > diff --git a/include/hw/i2c/pmbus_device.h
> b/include/hw/i2c/pmbus_device.h
> > index 93f5d57c9d..7dc00cc4d9 100644
> > --- a/include/hw/i2c/pmbus_device.h
> > +++ b/include/hw/i2c/pmbus_device.h
> > @@ -501,6 +501,13 @@ void pmbus_send64(PMBusDevice *state, uint64_t
> data);
> >   */
> >  void pmbus_send_string(PMBusDevice *state, const char *data);
> >
> > +/**
> > + * @brief Receive data sent with Block Write.
> > + * @param dest - memory with enough capacity to receive the write
> > + * @param len - the capacity of dest
> > + */
> > +uint8_t pmbus_receive_block(PMBusDevice *pmdev, uint8_t *dest, size_t
> len);
> > +
> >  /**
> >   * @brief Receive data over PMBus
> >   * These methods help track how much data is being received over PMBus
> > --
> > 2.40.0.rc1.284.g88254d51c5-goog
> >
>

--0000000000009df4c805f826fa3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Apologies. I&#39;ve updated the commit descriptions and ad=
ded a sensor using this code in v2.<div><br></div><div>While doing block re=
ceive I discovered that it is valid behaviour to erase a field and have it =
be an empty string.</div><div><br></div><div>-Titus</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 30 Mar 202=
3 at 09:18, Corey Minyard &lt;<a href=3D"mailto:minyard@acm.org">minyard@ac=
m.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">It&#39;s generally frowned upon to have empty descriptions, some ratio=
nale<br>
would be helpful.=C2=A0 For instance, you remove a length check from the se=
nd<br>
string, why did you do that?<br>
<br>
Any why is this being added?=C2=A0 What&#39;s it supporting?<br>
<br>
-corey<br>
<br>
On Wed, Mar 22, 2023 at 05:55:09PM +0000, Titus Rwantare wrote:<br>
&gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=
=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Signed-off-by: Titus Rwantare &lt;<a href=3D"mailto:titusr@google.com"=
 target=3D"_blank">titusr@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/i2c/pmbus_device.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 30 ++++=
+++++++++++++++++++++++++-<br>
&gt;=C2=A0 include/hw/i2c/pmbus_device.h |=C2=A0 7 +++++++<br>
&gt;=C2=A0 2 files changed, 36 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c<br>
&gt; index c3d6046784..02647769cd 100644<br>
&gt; --- a/hw/i2c/pmbus_device.c<br>
&gt; +++ b/hw/i2c/pmbus_device.c<br>
&gt; @@ -95,7 +95,6 @@ void pmbus_send64(PMBusDevice *pmdev, uint64_t data)=
<br>
&gt;=C2=A0 void pmbus_send_string(PMBusDevice *pmdev, const char *data)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 size_t len =3D strlen(data);<br>
&gt; -=C2=A0 =C2=A0 g_assert(len &gt; 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_assert(len + pmdev-&gt;out_buf_len &lt; SMBUS_DA=
TA_MAX_LEN);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pmdev-&gt;out_buf[len + pmdev-&gt;out_buf_len] =3D=
 len;<br>
&gt;=C2=A0 <br>
&gt; @@ -105,6 +104,35 @@ void pmbus_send_string(PMBusDevice *pmdev, const =
char *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pmdev-&gt;out_buf_len +=3D len + 1;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +uint8_t pmbus_receive_block(PMBusDevice *pmdev, uint8_t *dest, size_t=
 len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 /* dest may contain data from previous writes */<br>
&gt; +=C2=A0 =C2=A0 memset(dest, 0, len);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Exclude command code from return value */<br>
&gt; +=C2=A0 =C2=A0 pmdev-&gt;in_buf++;<br>
&gt; +=C2=A0 =C2=A0 pmdev-&gt;in_buf_len--;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* The byte after the command code denotes the length *=
/<br>
&gt; +=C2=A0 =C2=A0 uint8_t sent_len =3D pmdev-&gt;in_buf[0];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (sent_len !=3D pmdev-&gt;in_buf_len - 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;%s: length mismatch. Expected %d bytes, got %d bytes\n&quot;,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__, sent_len, pmdev-&gt;in_buf_len - 1);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* exclude length byte */<br>
&gt; +=C2=A0 =C2=A0 pmdev-&gt;in_buf++;<br>
&gt; +=C2=A0 =C2=A0 pmdev-&gt;in_buf_len--;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (pmdev-&gt;in_buf_len &lt; len) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D pmdev-&gt;in_buf_len;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 memcpy(dest, pmdev-&gt;in_buf, len);<br>
&gt; +=C2=A0 =C2=A0 return len;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static uint64_t pmbus_receive_uint(PMBusDevice *pmdev)<br>
&gt;=C2=A0 {<br>
&gt; diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_devi=
ce.h<br>
&gt; index 93f5d57c9d..7dc00cc4d9 100644<br>
&gt; --- a/include/hw/i2c/pmbus_device.h<br>
&gt; +++ b/include/hw/i2c/pmbus_device.h<br>
&gt; @@ -501,6 +501,13 @@ void pmbus_send64(PMBusDevice *state, uint64_t da=
ta);<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 void pmbus_send_string(PMBusDevice *state, const char *data);<br=
>
&gt;=C2=A0 <br>
&gt; +/**<br>
&gt; + * @brief Receive data sent with Block Write.<br>
&gt; + * @param dest - memory with enough capacity to receive the write<br>
&gt; + * @param len - the capacity of dest<br>
&gt; + */<br>
&gt; +uint8_t pmbus_receive_block(PMBusDevice *pmdev, uint8_t *dest, size_t=
 len);<br>
&gt; +<br>
&gt;=C2=A0 /**<br>
&gt;=C2=A0 =C2=A0* @brief Receive data over PMBus<br>
&gt;=C2=A0 =C2=A0* These methods help track how much data is being received=
 over PMBus<br>
&gt; -- <br>
&gt; 2.40.0.rc1.284.g88254d51c5-goog<br>
&gt; <br>
</blockquote></div>

--0000000000009df4c805f826fa3a--
