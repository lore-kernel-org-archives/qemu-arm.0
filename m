Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9537703wrx;
        Sat, 9 Mar 2019 06:32:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqx3S0hw/7ZVh+1TcnnUNCNsHkStcxgm76J4HuQq5IhMonljdXYyOe5P7c2IiZdgoY7HJj5P
X-Received: by 2002:a81:9955:: with SMTP id q82mr7637875ywg.416.1552141972746;
        Sat, 09 Mar 2019 06:32:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552141972; cv=none;
        d=google.com; s=arc-20160816;
        b=MQ7SnP1Jb4hATgzZWqku+ZFYU1OT3YC0p8/46XvRfon/bqKzARTwgOGAUw4dKP9dK6
         8TuQ45TXxnL/6p+1yjCyK1DvtsWF3h6ymXlTQm/l/vmnzU1NddXgT9QE4hW+T1g0a+0M
         UJtz/sfNXPv7z1IWoDXAlod7z4Hj93HQLxLzVHj27wP2APTWMMU2fMzGUghBWUTaMppw
         LryuazNs/qLAH2LhrbltzqVBk6dpIUJ5dtQaGeP49CWWvcAgIRvxL52eCVxpA6OgAFJ0
         TTXNcPZAzNxDKAvqQVmaDKmkOTvfo2g6wjAFY9MDQXRhDiVKfrvQ0nFAkdBxh+1oh5dv
         ONtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=hKdlzbIaBti5bOxjX0/Y+G6Zs/6grfBOPbkWyScAHeE=;
        b=H+0Kwxvd4LlkYX86hLtEe+WVViBRPA1ferSpvCDSXputeNB2HT4uWmyQhNAFxiOL1q
         P2vg0jyCv/WZCmjiQAaH2EJqEl9WVSMPmo+Lc43qCemwvZqSfOvuSZm+0V8rXfhm/CV0
         dOifP5XcgmLKybzJ7iRM+58EcWwJijRpR5luJDYPq9YwV0GIPpj+qPd8tMsa11/HoJxP
         H4IA7YD8lC4OfRLE7Mt3TnYzPnerKD/wYLeALaSbnqX7+8L6lqh8C/lsJ0mLDdjaJkNi
         5+H+Y1+QH1BzxZRDWCcfbuoPVd6YZ+ZVZtypXrPY48A9W8oQ4b9PgiP4gwez/IqSAjTT
         +CzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z62si278082ywd.439.2019.03.09.06.32.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Mar 2019 06:32:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2d1w-0003Ww-4r
	for alex.bennee@linaro.org; Sat, 09 Mar 2019 09:32:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h2d1k-0003We-JS
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 09:32:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h2d1i-00065E-Ly
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 09:32:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41552)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h2d1f-000629-Lk; Sat, 09 Mar 2019 09:32:37 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB5EA30B49C3;
	Sat,  9 Mar 2019 14:32:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4967760BE2;
	Sat,  9 Mar 2019 14:32:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 838511138660; Sat,  9 Mar 2019 15:32:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-4-philmd@redhat.com>
	<71bce75b-a2a9-061b-a1c2-7c4e49d957b1@redhat.com>
Date: Sat, 09 Mar 2019 15:32:20 +0100
In-Reply-To: <71bce75b-a2a9-061b-a1c2-7c4e49d957b1@redhat.com> (Laszlo Ersek's
	message of "Fri, 8 Mar 2019 10:48:07 +0100")
Message-ID: <87y35o3yq3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Sat, 09 Mar 2019 14:32:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 03/18] cutils: Add
 qemu_strdup_hexlify() and qemu_strdup_unhexlify()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yNm9Q6gxi2hy

Laszlo Ersek <lersek@redhat.com> writes:

> Hi Phil,
>
> most important comment at the bottom.
>
> On 03/08/19 02:32, Philippe Mathieu-Daud=C3=A9 wrote:
>> Add two helpers: one to represent a binary data as a string of
>> hexadecimal values, and one to restore a such string into its
>> original binary data.
>>=20
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>  include/qemu/cutils.h | 33 ++++++++++++++++++++++++++
>>  util/cutils.c         | 55 +++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 88 insertions(+)
>>=20
>> diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
>> index d2dad3057c..375a5508b0 100644
>> --- a/include/qemu/cutils.h
>> +++ b/include/qemu/cutils.h
>> @@ -171,6 +171,39 @@ bool test_buffer_is_zero_next_accel(void);
>>  int uleb128_encode_small(uint8_t *out, uint32_t n);
>>  int uleb128_decode_small(const uint8_t *in, uint32_t *n);
>>=20=20
>> +/**
>> + * qemu_strdup_hexlify:
>
> (1) I think the name "hexlify" is unusual.

hexlify-buffer is an interactive autoloaded Lisp function in
=E2=80=98hexl.el=E2=80=99.

(hexlify-buffer)

Convert a binary buffer to hexl format.
This discards the buffer=E2=80=99s undo information.

;-P

>                                            I think we should use
> encode/decode terminology, or hex/unhex, or, if we want to stick with
> the "stringify" pattern, hexify/unhexify. (No "l".)
>
>> + *
>> + * Encode a sequence of binary data into its hexadecimal stringified
>> + * representation.
>> + *
>> + * @ptr: Buffer to hexlify

Similar parameters elsewhere in this header are called @buf.

>> + * @size: Length of the buffer
>> + *
>> + * Use qemu_strdup_unhexlify() to convert the hex string to original da=
ta.
>> + *
>> + * Returns: A newly allocated, zero-terminated hex encoded string repre=
senting
>> + * the data. The returned string must be freed with g_free().
>> + */
>> +gchar *qemu_strdup_hexlify(gconstpointer ptr, gsize size);

Avoid the silly GLib types, please.

>> +
>> +/**
>> + * qemu_strdup_unhexlify:
>> + *
>> + * Decode a sequence of hexadecimal encoded text into binary data.
>> + *
>> + * @hex_string: String to unhexlify
>> + * @out_size: if not NULL: gsize to be written with the data length
>> + *
>> + * This function is the opposite of qemu_strdup_hexlify().
>> + *
>> + * Returns: A newly allocated buffer containing the binary data that te=
xt
>> + * represents. The returned buffer must be freed with g_free().
>> + * Note that the returned binary data is not necessarily zero-terminate=
d,
>> + * so it should not be used as a character string.
>> + */
>> +gpointer qemu_strdup_unhexlify(const gchar *hex_string, gsize *out_size=
);
>> +
>>  /**
>>   * qemu_pstrcmp0:
>>   * @str1: a non-NULL pointer to a C string (*str1 can be NULL)
>> diff --git a/util/cutils.c b/util/cutils.c
>> index e098debdc0..bf324c0d8b 100644
>> --- a/util/cutils.c
>> +++ b/util/cutils.c
>> @@ -779,6 +779,61 @@ int uleb128_decode_small(const uint8_t *in, uint32_=
t *n)
>>      }
>>  }
>>=20=20
>> +static guchar hexval(const gchar v)

Naming the parameter @ch would be more idiomatic, I think.

>> +{
>> +    switch (v) {
>> +    case '0' ... '9':
>> +        return v - '0';
>> +    case 'A' ... 'F':
>> +        return v - 'A' + 10;
>> +    case 'a' ... 'f':
>> +        return v - 'a' + 10;
>> +    default:
>> +        return 0;
>> +    }
>> +}
>
> (2) I don't think that we should silently translate invalid characters
> to zero, in any hexadecimal decoder.

Yup.  Let's abort().

>> +
>> +gchar *qemu_strdup_hexlify(gconstpointer ptr, gsize len)
>> +{
>> +    guchar *data =3D (guchar *)ptr;
>> +    gchar *hex_string;
>> +
>> +    if (!ptr || !len) {
>> +        return g_strdup("");
>> +    }

A null pointer is not the same as the empty string.  Replace this by

        assert(ptr);

and ...

>> +
>> +    hex_string =3D g_malloc(2 * len + 1);
>
> (3) Should check against integer overflow in the g_malloc() argument
> (multiplication and addition).

E.g.
        assert(len <=3D (SIZE_MAX - 1) / 2);

>> +    for (gsize i =3D 0; i < len; i++) {
>> +        g_snprintf(&hex_string[2 * i], 3, "%02x", data[i]);
>> +    }
>> +

... esnure termination here

        hex_string[2 * i] =3D 0;

What does g_snprintf() buy us over plain snprintf()?  I count 400+ uses
of the latter, and none of the former.

>> +    return hex_string;
>> +}
>> +
>> +gpointer qemu_strdup_unhexlify(const gchar *hex_string, gsize *out_size)
>> +{
>> +    size_t size =3D 0;
>> +    guchar *data =3D NULL;
>> +
>> +    if (hex_string) {

A null pointer is not the same as the empty string.  assert(hex_string)
and make the conversion unconditional.


>> +        size =3D strlen(hex_string) / 2;
>
> (4) Should likely check that the length of the string is an even integer.
>
>> +        if (size) {
>> +            size_t i;
>> +
>> +            data =3D g_new(guchar, size + 1);
>> +            for (i =3D 0; i < size; i++) {
>> +                data[i]  =3D hexval(*hex_string++) << 4;
>> +                data[i] |=3D hexval(*hex_string++);
>> +            }
>> +            data[i] =3D '\0';
>> +        }
>> +    }
>> +    if (out_size) {
>> +        *out_size =3D size;
>> +    }
>> +    return data;

This maps "" to null.  I think it shold return "".  It naturally does if
you make the if (size) code unconditional.

>> +}
>> +
>>  /*
>>   * helper to parse debug environment variables
>>   */
>>=20
>
> (5) Most importantly: I don't think we need this patch.
>
> First, AFAICS, the unhex function is never used in the series, and no
> unit test is being added for it. That makes it a bad candidate for
> "include/qemu/cutils.h".
>
> Second, while the hex function is used in PATCH v2 13/18
> ("hw/nvram/fw_cfg: Add QMP 'info fw_cfg' command"), the documentation in
> that patch and the logic in the patch are inconsistent. The
> documentation -- i.e. both the commit message and the "misc.json" change
> -- say that "FirmwareConfigurationItem.data" is unused (not populated).
> However, that's exactly what create_qmp_fw_cfg_item() uses the hex
> function for.
>
> Third, if we do decide that the QMP command should output the fw_cfg
> binary data, then the QMP tradition (to my knowledge) has been to use
> base64 encoding. GLib provides helpers for base64:
>
> https://developer.gnome.org/glib/stable/glib-Base64-Encoding.html
>
> and you can see examples of it being used in e.g.
>
> (a) qmp_ringbuf_read() [chardev/char-ringbuf.c] -- the  @ringbuf-read
> command is defined in "qapi/char.json"
>
> (b) qmp_guest_exec_status() [qga/commands.c] -- the @guest-exec-status
> command is defined in "qga/qapi-schema.json".

Yes.  I wish you had wrote that first, saving me the trouble of looking
at the patch.
